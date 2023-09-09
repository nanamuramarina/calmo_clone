class Admin::HotelsController < ApplicationController
  before_action :authenticate_hotel!

  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params)
      redirect_to admin_hotel_path(@hotel.id), notice: "保存に成功しました！"
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :post_code, :address, :phone_number, :email, :is_valid)
  end
end
