class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :brand, foreign_key: true
      t.string :name, null: false
      t.text :explannation, null: false
      t.string :status, null: false
      t.boolean :shipper, null: false
      t.string :shipping_area, null: false
      t.integer :lead_time, null: false
      t.integer :price, null: false
      t.string :size, null: false
      t.string :shipping_method, null: false
      t.timestamps
    end
  end
end
