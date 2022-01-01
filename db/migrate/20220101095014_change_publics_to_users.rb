class ChangePublicsToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :publics, :users
  end
end
