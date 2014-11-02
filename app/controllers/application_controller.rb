class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :rej
  def rej
  	project = Project.all
  	project.each do |p|
  		total = 0
  		num = 0
  		p.iterations.each do |i|
  			if i != nil and i.score != nil
  				total = total +i.score
  				num = num +1
  			end 
  		end 
  		if(num != 0)
  			p.update_attributes(:score =>total/num)
  		end
  	end
  	return
  end
end
