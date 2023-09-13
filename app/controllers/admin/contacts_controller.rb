class Admin::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    contact.update(contact_params)
    redirect_to admin_contacts_path(contact.id)
  end


  def contact_params
    params.require(:contact).permit(:name, :mail, :message,:is_support)
  end
end
