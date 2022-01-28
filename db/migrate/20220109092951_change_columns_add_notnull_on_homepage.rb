class ChangeColumnsAddNotnullOnHomepage < ActiveRecord::Migration[5.2]
  def change
    change_column_null :homepages, :store_id, false
    change_column_null :homepages, :url_type, false
    change_column_null :homepages, :url, false
  end
end
