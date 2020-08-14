# == Schema Information
#
# Table name: admins
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_admins_on_email                 (email) UNIQUE
#  index_admins_on_reset_password_token  (reset_password_token) UNIQUE
#
class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_many :users
  has_many :products, dependent: :destroy
  has_many :purchase_record_products, through: :products

  def sales
    sold_products = products.joins(:purchase_record_products)
    sold_products.sum(:price)
  end

  def sales_amount
    sold_products = products.joins(:purchase_record_products)
    sold_products.length
  end

  def sales_today
    sold_products = products
                        .joins(:purchase_record_products)
                        .where({ purchase_record_products:  {created_at: Time.current.all_day}})
    sold_products.sum(:price)                     
  end

  def sales_amount_today
    sold_products = products
                        .joins(:purchase_record_products)
                        .where({ purchase_record_products:  {created_at: Time.current.all_day}})
    sold_products.length
  end

  def sales_this_month
    sold_products = products
                        .joins(:purchase_record_products)
                        .where({ purchase_record_products:  {created_at: Time.current.all_month}})
    sold_products.sum(:price)                     
  end

  def sales_amount_month
    sold_products = products
                        .joins(:purchase_record_products)
                        .where({ purchase_record_products:  {created_at: Time.current.all_month}})
    sold_products.length
  end

  def sales_detail
    sold_products = products.joins(:purchase_record_products)
  end

end
