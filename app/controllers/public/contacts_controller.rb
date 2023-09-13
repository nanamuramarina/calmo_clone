class Public::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    contact = Contact.new(contact_params)
    contact.save
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :mail, :message)
  end

end
