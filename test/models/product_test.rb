# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  category    :string
#  color       :string
#  description :text             not null
#  gender_type :string
#  image       :string
#  name        :string           not null
#  price       :integer          not null
#  size        :integer
#  stock       :integer
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
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
