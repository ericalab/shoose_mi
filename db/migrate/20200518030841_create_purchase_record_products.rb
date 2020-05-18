class CreatePurchaseRecordProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_record_products do |t|
      t.references :purchase_record, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
