class Admins::DashboardsController < Admins::ApplicationController
    def index
        @total_price = current_admin.sales*Coefficient::CONSUMPTION_TAX
        @total_amount = current_admin.sales_amount
        @total_today = current_admin.sales_today*Coefficient::CONSUMPTION_TAX
        @total_price_this_month = current_admin.sales_this_month*Coefficient::CONSUMPTION_TAX
    end
end