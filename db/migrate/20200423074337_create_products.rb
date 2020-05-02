class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, index: true, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :image

      t.timestamps
    end
  end
end
