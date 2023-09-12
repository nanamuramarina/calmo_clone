class Public::MenusController < ApplicationController
  def index
    @menu = Menu.all
  end
  
  def show
    @menu = Menu.find(params[:id])
  end
end
