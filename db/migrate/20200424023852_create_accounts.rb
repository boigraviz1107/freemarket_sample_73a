class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :post_num, null: false 
      t.string :prefecture_id, null: false
      t.string :city, null: false
      t.string :city_num, null: false
      t.string :building 
      t.string :phone_num
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
