class Lab < ActiveRecord::Base
  attr_accessible :lab1, :lab2, :lab3, :lab4, :lab5, :lab6, :lab7, :score, :student_id
  belongs_to :student
end
