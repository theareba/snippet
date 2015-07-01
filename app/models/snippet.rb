class Snippet < ActiveRecord::Base
  def self.search(search)
    where("content like ?", "%#{search}%")
  end
end
