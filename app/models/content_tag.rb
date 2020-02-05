class ContentTag < ApplicationRecord
  belongs_to :content
  belongs_to :tag

  # validates :tag_id,  uniquness: { scope: [:content_id]  }
end
