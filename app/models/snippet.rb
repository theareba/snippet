class Snippet < ActiveRecord::Base
  validates_length_of :content, maximum: 8192
  scope :public_snippets, ->  {where(private: false)}

  before_save :generate_token, if: Proc.new { self.private? }

  def generate_token
    begin
      self.token = SecureRandom.urlsafe_base64(64, false)
      save!
    end while self.class.find_by(token: token)
  end

  def self.search(search)
    where("content like ?", "%#{search}%")
  end
end
