# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  category    :string(255)
#  color       :string(255)
#  description :text(65535)      not null
#  image       :string(255)
#  name        :string(255)      not null
#  price       :integer          not null
#  size        :integer
#  type        :string(255)
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
