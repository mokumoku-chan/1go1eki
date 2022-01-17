class StoreImage < ApplicationRecord
  belongs_to :store
  attachment :image
end
