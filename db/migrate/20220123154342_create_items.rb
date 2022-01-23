class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :store_id, null: false
      t.string :name
      t.string :image_id
      t.string :comment
      t.string :price
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
