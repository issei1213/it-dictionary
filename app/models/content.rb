class Content < ApplicationRecord
  has_many :content_tags, dependent: :destroy
  has_many :tags, through: :content_tags, dependent: :delete_all


  def save_tags(tag_list)
    tag_list.each do |tag|
      unless find_tag = Tag.find_by(name: tag)
        begin
          self.tags.create!(name: tag)
        rescue
          nil
        end
      else
        ContentTag.create!(content_id: self.id, tag_id: find_tag.id)
    end
  end

  def update_tags(tag_list)
    tag_list.each do |tag|
      unless find_tag = Tag.find_by(name: tag)
        begin
          self.tags.update!(name: tag)
        rescue
          nil
        end
      else
        ContentTag.update!(content_id: self.id, tag_id: find_tag.id)
    end
  end

end
end
end
