class PagesController < ApplicationController
    # Get request home
    def home
        @basic_plan = Plan.find(1)
        @pro_plan = Plan.find(2)
    end
    
    # Get request /about
    def about
    end
end