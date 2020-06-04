class Admins::DashboardsController < Admins::ApplicationController
    def index
        @total_price = current_admin.sales*Coefficient::CONSUMPTION_TAX

    end
end