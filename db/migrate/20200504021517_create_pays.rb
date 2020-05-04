class CreatePays < ActiveRecord::Migration[5.2]
  def change
    create_table :pays do |t|
      t.references :user, foreign_key: true, null: false
      t.text :customer_id, null: false
      t.text :card_id, null: false
      t.timestamps
    end
  end
end
