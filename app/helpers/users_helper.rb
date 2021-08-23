module UsersHelper
    # Display icon based on job title in profile
    def job_title_icon
        if @user.profile.job_title == "Student"
            "<i class='fa fa-graduation-cap'></i>".html_safe
        elsif @user.profile.job_title == "Tutor"
            "<i class='fa fa-user'></i>".html_safe
        end
    end
end