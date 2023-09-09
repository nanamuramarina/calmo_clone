class Hotel::MenusController < ApplicationController
  before_action :authenticate_admin!

  def new
    @mene = Menu.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product.id)
      flash[:notice] = "商品を登録しました"
    else
      render :new
      flash[:alert] = "商品の登録に失敗しました"
    end
  end

  def index
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "商品を編集しました"
      redirect_to admin_product_path(@product.id)
    else
      flash[:alert] = "商品の編集に失敗しました"
      render :edit
    end
  end

  private

  def product_params
    params.require(:menu).permit(:hotel_id, :title, :price, :detail, :is_available, :image)
  end
end
