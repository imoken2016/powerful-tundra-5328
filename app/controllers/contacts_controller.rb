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
  
  def inbox
    Mail.defaults do
      retriever_method(:pop3,
      address:        "pop.gmail.com",
      port:           995,
       user_name:      "recent:#{ENV['GMAIL_USER_NAME']}",
       password:       ENV['GMAIL_PASSWORD'],
      enable_ssl:     true
      )
    end
    @mails = Mail.find(:what => :all, :count => 10, :order => :asc)
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name,:email,:title,:message)
    end
  
end
