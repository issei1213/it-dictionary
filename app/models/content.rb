class Content < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :labels
end
