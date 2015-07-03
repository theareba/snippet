class Snippet < ActiveRecord::Base
  validates_length_of :content, maximum: 8192
  validates_presence_of :content
  scope :public_snippets, ->  {where(private: false)}

  after_create :generate_token, if: Proc.new { self.private? }
  after_save :load_into_soulmate
  before_destroy :remove_from_soulmate

  def generate_token
    begin
      self.token = SecureRandom.urlsafe_base64(64, false)
    end while Snippet.exists?(token: token)
    save!
  end

  def self.search(search)
    where("content like ?", "%#{search}%")
  end

  private
    def load_into_soulmate
      loader = Soulmate::Loader.new("snippets")
      loader.add("term" => content, "id" => self.id, "data" => {
                                   "link" => Rails.application.routes.url_helpers.snippet_path(self)
                               })
    end

    def remove_from_soulmate
      loader = Soulmate::Loader.new("snippets")
      loader.remove("id" => self.id)
    end

end

