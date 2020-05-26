# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text(65535)      not null
#  image       :string(255)
#  name        :string(255)      not null
#  price       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  admin_id    :bigint           not null
#
# Indexes
#
#  index_products_on_admin_id  (admin_id)
#  index_products_on_name      (name)
#
# Foreign Keys
#
#  fk_rails_...  (admin_id => admins.id)
#
class Product < ApplicationRecord
    include Hashid::Rails
    mount_uploader :image, ImageUploader
    has_many :basket_products, dependent: :destroy
    belongs_to :admin

    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
end
