class ContactsController < ApplicationController

  def index
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new()
    end
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      render :action => 'confirm'
    else
      @contact = Contact.new(contact_params)
      render :action => 'index'
    end
  end

  def thanks
    @contact = Contact.new(contact_params)
    if params[:back]
      render :action => 'index'
    else
      respond_to do |format|
        if @contact.save
          format.html { render :thanks }
        else
          format.html { render :index }
        end
      end
    end
  end
 
  private
    def contact_params
      params.require(:contact).permit(:name,:email,:title,:message)
    end
  
end
