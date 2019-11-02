class CourseStudent < ApplicationRecord
  validates_presence_of :grade, :course_id, :student_id

  belongs_to :course
  belongs_to :student
end
