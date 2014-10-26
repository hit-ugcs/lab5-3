class Iteration < ActiveRecord::Base
  attr_accessible :iteNum, :score , :student_id, :project_id
  belongs_to :student
  belongs_to :project
end
