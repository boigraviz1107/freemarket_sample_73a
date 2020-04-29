class AddDefaultToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :shipper, :boolean, null: true
  end
end
