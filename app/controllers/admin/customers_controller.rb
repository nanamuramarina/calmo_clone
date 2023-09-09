class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id), notice: "保存に成功しました！"
    else
      render :edit
    end
  end

  def confirm_withdraw
  end

  def withdraw
    current_customer.update(is_valid: false)
    reset_session
    flash[:notic] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :is_valid)
  end
end
