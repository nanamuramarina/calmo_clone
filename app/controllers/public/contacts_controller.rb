class Public::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      flash[:notice] = "送信されました"
      redirect_to root_path
    else
      flash[:alert] = "送信に失敗しました"
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :mail, :message, :is_support)
  end

end
