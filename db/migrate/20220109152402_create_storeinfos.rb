class CreateStoreinfos < ActiveRecord::Migration[5.2]
  def change
    create_table :storeinfos do |t|
      t.integer :store_id, null: false
      t.string :station, null: false
      t.string :place
      t.string :start_period, null: false
      t.string :end_period, null: false
      t.string :open_time, null: false
      t.string :close_time, null: false

      t.timestamps
    end
  end
end
