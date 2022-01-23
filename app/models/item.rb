class Item < ApplicationRecord
  belongs_to :store
  attachment :image
end
