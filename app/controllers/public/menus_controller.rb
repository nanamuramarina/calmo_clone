class Public::MenusController < ApplicationController
  def index
    @menu = Menu.all.order(created_at: :desc)
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @customer = current_customer
     @star = Star.find(params[:id])
  end

  def update
    menu = Menu.find(params[:id])
    if menu.update(menu_params)
      @menu = menu
      flash[:notice] = "評価ができました"
      render :show
    else
      flash[:alert] = "エラーが発生しました"
      render :edit
    end
  end

  private

#   def menu_params
#     params.require(:menu).permit(:star)
#   end
end
