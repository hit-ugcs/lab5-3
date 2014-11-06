class UpdateMailer < ActionMailer::Base
  default from: 'haposola@gmail.com'
  def sendmail(studentid)
  	mail(to: Student.find(studentid).email, subject: "Teacher has updated the score")
  end
end
