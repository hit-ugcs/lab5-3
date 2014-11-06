class UpdateMailer < ActionMailer::Base
  default 
  def sendmail(studentid)
  	mail(to: Student.find(studentid).email ,from: 'haposola@gmail.com', subject: "Teacher has updated the score")
  end
end
