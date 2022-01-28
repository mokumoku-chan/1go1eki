class Review < ApplicationRecord
  belongs_to :store

  validates :title, presence: true
  validates :comment, presence: true
  validates :evaluation, presence: true

end
