class Public::SearchesController < ApplicationController
  def index
    @hotel = Hotel.find(params[:hotel_id])
    @menus = Menu.where(hotel_id: params[:hotel_id])
  end
  
  private
  
end