class Content < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :labels

  belongs_to :user
  has_many :likes, dependent: :destroy

  def self.search_title(search)
    return Content.all unless search
    Content.where('title LIKE(?)', "%#{search}%")
  end


  def self.search_content(search)
    return Content.all unless search
    Content.where('content LIKE(?)', "%#{search}%")
  end

end
