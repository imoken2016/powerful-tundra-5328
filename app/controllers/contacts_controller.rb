class ContactsController < ApplicationController

  def index
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      render :action => 'confirm'
    else
      render :action => 'index'
    end
  end

  def thanks
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        format.html { render :thanks }
      else
        format.html { render :index }
      end
    end
  end
 
  private
    def contact_params
      params.require(:contact).permit(:name,:email,:title,:message)
    end
  
end
