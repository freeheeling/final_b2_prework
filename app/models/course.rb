class Course < ApplicationRecord
  validates_presence_of :name

  has_many :course_students
  has_many :students, through: :course_students
end
