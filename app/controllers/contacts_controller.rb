class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        if !params[:contact][:email].include?("@")
            flash[:danger] = "Email is not valid"
            redirect_to new_contact_path
        elsif @contact.save
            #name = params[:contact][:name]
            #email = params[:contact][:email]
            #body = params[:contact][:comments]
            #ContactMailer.contact_email(name, email, body).deliver
            flash[:info] = "Message Sent"
            redirect_to root_path
        else
            flash[:danger] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        end
    end
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end