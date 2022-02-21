class ContactsController < ApplicationController

  # layout 'home'
  
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
      render template: 'contacts/create'
    end

  end

  private
  def contact_params
    params.require(:contact).permit(:topic, :name, :email, :message, :nickname)
  end

end
