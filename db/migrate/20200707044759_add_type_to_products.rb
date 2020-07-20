class AddTypeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :type, :string, index: true
    add_column :products, :category, :string, index: true
    add_column :products, :color, :string, index: true
    add_column :products, :size, :integer, index: true
  end
end
