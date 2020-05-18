class ChargesController < ApplicationController
    def create
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
        token = params[:stripeToken]
        product_ids = params[:product_ids].map(&:to_i)

        products = current_user.basket.products.where(id: product_ids)
        total = products.sum(:price)

        basket_products = current_user.basket.basket_products.where(product_id: product_ids)
        basket_products.each(&:destroy!)

        Charge.create!(total, token)
        redirect_to root_path, notice: '決済に成功しました'
    end
end