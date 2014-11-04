class Student < ActiveRecord::Base
  attr_accessible :name, :studentID
  has_one :project, dependent: :destroy
  has_many :iterations , through: :project, dependent: :destroy
  has_one :lab, dependent: :destroy
end
