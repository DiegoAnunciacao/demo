class Admin::ProductsController < Admin::ApplicationController
  before_action :set_product, only: [ :edit, :show, :update, :destroy ]

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to admin_root_path(@product), notice: "Product successful created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_root_path(@product), notice: "Product successful updated"
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_root_path, notice: "Product destroyed"
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
