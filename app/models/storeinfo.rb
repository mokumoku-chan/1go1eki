class Storeinfo < ApplicationRecord
  belongs_to :store

  validates :station, presence: true
  validates :start_period, presence: true
  validates :end_period, presence: true
  validates :open_time, presence: true
  validates :close_time, presence: true

  def self.search(search)
    if search
       where(['station LIKE ?', "%#{search}%"])

    else
      all
    end
  end

end
