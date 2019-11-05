class CourseStudentsController < ApplicationController

  def create
    course_student = CourseStudent.create(course_student_params)
    student = CourseStudent.find(params[:name])
    redirect_to student_path(student.id)
  end

  def destroy
    course_student = CourseStudent.find_by(course_student_params)
    course_student.destroy
    redirect_to student_path(course_student.student.id)
  end

  private
    def course_student_params
      params.permit(:course_id, :student_id, :grade)
    end
end
