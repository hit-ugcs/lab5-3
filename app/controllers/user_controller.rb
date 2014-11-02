class UserController < ApplicationController
  def signin
  end
  def check
  	if params[:user] == "dennisp" and params[:pwd]=="saasha2014"
  		redirect_to students_path, notice:"login succeed" and return
  	else 
  		redirect_to "/user/signin",notice: "no authorization" and return
  	end
  end
end
