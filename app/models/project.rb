class Project < ActiveRecord::Base
  attr_accessible :score
  belongs_to :student
  has_many :iterations
end
