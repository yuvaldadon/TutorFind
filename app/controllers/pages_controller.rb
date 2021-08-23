class PagesController < ApplicationController
    # GET root
    def home
        @basic_plan = Plan.find(1)
        @pro_plan = Plan.find(2)
    end
    
    # GET /about
    def about
    end
end