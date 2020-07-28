class Admins::SalesRecordsController < Admins::ApplicationController
    def index
        @sold_products = current_admin.sales_detail
    end
end