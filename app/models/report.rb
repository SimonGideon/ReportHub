class Report < ApplicationRecord
  belongs_to :user
  belongs_to :department
  has_rich_text :content
end
