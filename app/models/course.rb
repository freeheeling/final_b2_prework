class Course < ApplicationRecord
  validates_presence_of :name

  has_many :course_students
  has_many :students, through: :course_students

  def rank_grades
    students.joins(:course_students).order('course_students.grade desc')
  end
end
