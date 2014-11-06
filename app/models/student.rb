class Student < ActiveRecord::Base
  attr_accessible :name, :studentID, :email, :address, :phone, :memo,:sum,:grade
  has_one :project, dependent: :destroy
  has_many :iterations , through: :project, dependent: :destroy
  has_one :lab, dependent: :destroy
  has_one :final, dependent: :destroy
  has_one :disc, dependent: :destroy
  has_one :atten, dependent: :destroy
end
