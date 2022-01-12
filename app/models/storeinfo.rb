class Storeinfo < ApplicationRecord
  has_many :stores, dependent: :destroy
end
