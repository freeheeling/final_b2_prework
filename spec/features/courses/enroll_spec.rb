require 'rails_helper'

RSpec.describe 'Course Enrollment' do
  it 'the course show page displays a form to enroll a new student' do
    art = Course.create!(name: 'Art')
    dan = Student.create!(name: 'Dan')

    visit course_path(art.id)

    expect(page).to have_content('Enroll a New Student')

    fill_in :name, with: dan.name

    click_on 'Submit'

    art_dan = CourseStudent.create!(course: art, student: dan, grade: 4.0)

    expect(current_path).to eq(student_path(dan.id))

    within "#course-#{art.id}" do
      expect(page).to have_content("Course: #{art.name}")
      expect(page).to have_content("Grade: #{art_dan.grade}")
    end
  end
end
