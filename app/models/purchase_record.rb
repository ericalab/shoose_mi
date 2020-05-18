# == Schema Information
#
# Table name: purchase_records
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_purchase_records_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class PurchaseRecord < ApplicationRecord
    belongs_to :user
    has_many :purchase_record_products, dependent: :destroy
    has_many :products, through: :purchase_record_products
end
