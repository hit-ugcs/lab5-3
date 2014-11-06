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
  	UpdateMailer.sendmail(1).deliver()
  	redirect_to students_path
  end
end
