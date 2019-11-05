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
#
# When I visit a course show page,
# Then I see a form to enroll a new student in this course that has a single input field for the student name.
# When I type in the name of a student
# And I click the submit button
# Then a new student is created,
# And I am redirected to that student's show page where I see the course listed
# (no need for sad path testing i.e. name field is left blank, if the name already exists)
