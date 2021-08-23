class ContactsController < ApplicationController
    # Get /contact-us
    def new
        @contact = Contact.new
    end
    
    # Post /contact-us
    def create
        @contact = Contact.new(contact_params)
        
        # Check valid email
        if !params[:contact][:email].include?("@")
            flash[:danger] = "Email is not valid"
            redirect_to new_contact_path
            
        # Save Form to db
        elsif @contact.save
            #name = params[:contact][:name]
            #email = params[:contact][:email]
            #body = params[:contact][:comments]
            #ContactMailer.contact_email(name, email, body).deliver
            flash[:info] = "Message Sent"
            redirect_to root_path
            
        # Display error on fail
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