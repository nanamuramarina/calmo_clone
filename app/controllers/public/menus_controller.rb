class Public::MenusController < ApplicationController
  def index
    @menu = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @customer = current_customer
  end

  def update
   if current_customer.update(menu_params)
     redirect_to menu_path
   else
     render edit
   end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image, :star)
  end
end
