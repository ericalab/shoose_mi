# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text(65535)      not null
#  name        :string(255)      not null
#  price       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_products_on_name  (name)
#
class Product < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
end
