class CreateHomepages < ActiveRecord::Migration[5.2]
  def change
    create_table :homepages do |t|
      t.integer :store_id
      t.integer :url_type
      t.string :url

      t.timestamps
    end
  end
end
