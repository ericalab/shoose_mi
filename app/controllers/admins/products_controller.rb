class Admins::ProductsController < Admins::ApplicationController
    def index
      if params[:product].present?
        @products = Product.where("id = ? OR name LIKE ?", params[:product][:id], params[:product][:name])
      else
        @products = Product.page(params[:page])
      end
    end

    def new
        @product = current_admin.products.build
    end
    
    def create
      @product = current_admin.products.build(product_params)
      if @product.save
        flash[:notice] = "「#{@product.name}」を登録しました"
        redirect_to root_path
      else
        flash[:error] = '作成に失敗'
        render :new
      end
    end

    def edit
      @product.attributes = flash[:board] if flash[:board]
    end

    def update
    end

    def destroy
      @product.destroy
      redirect_to boards_path, flash: { notice: "「#{@product.name}」を削除しました。" }
    end
    
    private
    def product_params
        params.require(:product).permit(:name, :price, :gender_type, :category, :color, :size, :image, :description, :stock)
    end

    def set_target_prpduct
      @product = Product.find(params[:id])
    end
end