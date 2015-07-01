class Snippet < ActiveRecord::Base
  validates_length_of :content, maximum: 8192
  scope :public_snippets, ->  {where(private: false)}

  after_create :generate_token, if: Proc.new { self.private? }

  def generate_token
    begin
      self.token = SecureRandom.urlsafe_base64(64, false)
      save!
    end
  end

  def self.search(search)
    where("content like ?", "%#{search}%")
  end
end
