class Storeinfo < ApplicationRecord
  belongs_to :store

  def self.search(search)
    if search
       where(['station LIKE ?', "%#{search}%"])

    else
      all
    end
  end

end
