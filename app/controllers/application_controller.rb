class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :checkUpdates
  def checkUpdates
	@scoreUpdate = ScoreUpdates.all
		if @scoreUpdate.length>0
			@notice = "You have some updates that haven't inform the students"
		end
  end
  def sending
      @students = Student.all
      respond_to do |format|
        @students.each do|s|
          if s.email != nil && s.email !=""
  	     UpdateMailer.sendmail(s.id).deliver()
          else 
            redirect_to students_path, notice: "#{s.name} has no email address" and return
          end
        end 
       updates = ScoreUpdates.all
       updates.each do |u|
        u.destroy
       end
  	redirect_to students_path, notice: "email send succeeded" and return 
    end
  end
end
