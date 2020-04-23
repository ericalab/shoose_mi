class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, index: true, foreign_key: true, null: false
      t.references :size, index: true, foreign_key: true, null: false
      t.references :color, index: true, foreign_key: true, null: false
      
      t.string :name, index: true, null: false
      t.text :description, index: true, null: false
      t.integer :price, index: true, null: false

      t.timestamps
    end
  end
end
