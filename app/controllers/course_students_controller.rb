class CourseStudentsController < ApplicationController

  def create
    course = Course.create(course_params)
    student = Student.create(student_params)
    course_student = CourseStudent.create(course_id: course.id, student_id: student.id)
    redirect_to student_path(course_student.student.id)
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

    def course_params
      params.permit(:name)
    end

    def student_params
      params.permit(:name)
    end
end
