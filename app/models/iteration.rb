class Iteration < ActiveRecord::Base
  attr_accessible :score
  belongs_to :student
  belongs_to :project
end
