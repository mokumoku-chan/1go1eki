class CreateStoreImages < ActiveRecord::Migration[5.2]
  def change
    create_table :store_images do |t|

      t.integer :store_id, null: false
      t.string :image_id, null: false
      t.timestamps
    end
  end
end
