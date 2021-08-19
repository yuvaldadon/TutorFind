class Users::RegistrationsController < Devise::RegistrationsController
    
    #Connect costumer to Stripe for premium membership creation
    def create
        super do |resource|
            if params[:plan]
                resource.plan_id = params[:plan]
                
                # if premium sign up form
                if resource.plan_id == 2
                    resource.save_with_subscription
                    
                else
                    resource.save
                end
            end
        end
    end
end    