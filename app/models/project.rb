class Project < ActiveRecord::Base
  attr_accessible :score, :student_id
  belongs_to :student
  has_many :iterations
end

