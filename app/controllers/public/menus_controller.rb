class Public::MenusController < ApplicationController
  def index
    @menu = Menu.all.order(created_at: :desc)
  end

  def show
    @menu = Menu.find(params[:id])
    # コントローラ内で@star変数を設定する例
    @star = Star.find_by(id: params[:id])
    @star ||= 0
  end

  def edit
    @customer = current_customer
    @menu = Menu.find(params[:id])
    @star = Star.find_by(id: params[:id]) || 0
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
