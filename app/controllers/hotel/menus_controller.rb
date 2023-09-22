class Hotel::MenusController < ApplicationController
  before_action :authenticate_hotel!

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.hotel_id = current_hotel.id
    if @menu.save
      redirect_to hotel_menu_path(@menu.id)
      flash[:notice] = "メニューを登録しました"
    else
      render :new
      flash[:alert] = "メニューを登録に失敗しました"
    end
  end

  def index
    @menus = Menu.where(hotel_id: current_hotel.id)
  end

  def show
    @menu = Menu.find_by(id: params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      flash[:notice] = "メニューを編集しました"
      redirect_to hotel_menu_path(@menu.id)
    else
      flash[:alert] = "メニューの編集に失敗しました"
      render :edit
    end
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to root_path
  end

  private

  def menu_params
    params.require(:menu).permit(:hotel_id, :title, :price, :detail, :is_available, :image)
  end
end
