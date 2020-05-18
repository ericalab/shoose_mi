# == Schema Information
#
# Table name: purchase_record_products
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  product_id         :bigint           not null
#  purchase_record_id :bigint           not null
#
# Indexes
#
#  index_purchase_record_products_on_product_id          (product_id)
#  index_purchase_record_products_on_purchase_record_id  (purchase_record_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (purchase_record_id => purchase_records.id)
#
class PurchaseRecordProduct < ApplicationRecord
    belongs_to :product
    belongs_to :purchase_record
end
