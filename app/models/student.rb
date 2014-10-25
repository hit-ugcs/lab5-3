class Student < ActiveRecord::Base
  attr_accessible :name, :studentID
  has_one :project
  has_many :iterations , through: :project
end
