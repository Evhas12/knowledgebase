class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      redirect_to root_path, notice: 'Thank you for your message'
    else
      flash.now[:error] = 'Cannot send message'
      render contact_path
    end

  end

  private
  def contact_params
    params.require(:contact).permit(:topic, :name, :email, :message, :nickname)
  end

end
