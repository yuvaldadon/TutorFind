module UsersHelper
    def job_title_icon
        if @user.profile.job_title == "type1"
            "<i class='fa fa-code'></i>".html_safe
        elsif @user.profile.job_title == "type2"
            "<i class='fa fa-lightbulb-o'></i>".html_safe
        elsif @user.profile.job_title == "type3"
            "<i class='fa fa-dollar'></i>".html_safe
        end
    end
end