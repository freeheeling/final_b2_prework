require 'rails_helper'

RSpec.describe 'Student Show Page' do
  it 'displays name of student, their enrolled courses and grade by course' do
    art = Course.create!(name: 'Art')
    math = Course.create!(name: 'Music')

    bob = Student.create!(name: 'Bob')

    art_bob = CourseStudent.create!(course: art, student: bob, grade: 3.8)
    math_bob = CourseStudent.create!(course: math, student: bob, grade: 3.6)

    visit student_path(bob.id)

    expect(page).to have_content("#{bob.name}: Enrolled Courses and Grades")

    within "#course-#{art.id}" do
      expect(page).to have_content("Course: #{art.name}")
      expect(page).to have_content("Grade: #{art_bob.grade}")
    end

    within "#course-#{math.id}" do
      expect(page).to have_content("Course: #{math.name}")
      expect(page).to have_content("Grade: #{math_bob.grade}")
    end
  end
end
