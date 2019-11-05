class CourseStudentsController < ApplicationController

  def destroy
    CourseStudent.destroy.where('course_id, student_id')
    redirect_to student_path(course_student.student.id)
  end
end
