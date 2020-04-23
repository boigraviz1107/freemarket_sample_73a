class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :last_name, :string, null: false, default: ""
    add_column :users, :first_name_hira, :string, null: false, default: ""
    add_column :users, :last_name_hira, :string, null: false, default: ""
  end
end
