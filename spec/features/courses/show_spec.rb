require 'rails_helper'

RSpec.describe 'Course Show Page' do
  it 'displays the course name and lists each student from highest to lowest grade' do
    art = Course.create!(name: 'Art')

    bob = Student.create!(name: 'Bob')
    dan = Student.create!(name: 'Dan')
    lou = Student.create!(name: 'Lou')

    art_bob = CourseStudent.create!(course: art, student: bob, grade: 3.4)
    art_dan = CourseStudent.create!(course: art, student: dan, grade: 3.8)
    art_lou = CourseStudent.create!(course: art, student: lou, grade: 3.6)

    visit course_path(art.id)

    expect(page).to have_content("#{art.name}: Enrolled Students and Grades")

    within "#student-#{dan.id}" do
      expect(page).to have_content("Student: #{dan.name}")
      expect(page).to have_content("Grade: #{art_dan.grade}")
    end

    within "#student-#{lou.id}" do
      expect(page).to have_content("Student: #{lou.name}")
      expect(page).to have_content("Grade: #{art_lou.grade}")
    end

    within "#student-#{bob.id}" do
      expect(page).to have_content("Student: #{bob.name}")
      expect(page).to have_content("Grade: #{art_bob.grade}")
    end
  end

  it 'displays a button to unenroll a student next to their name' do
    art = Course.create!(name: 'Art')

    bob = Student.create!(name: 'Bob')
    dan = Student.create!(name: 'Dan')

    art_bob = CourseStudent.create!(course: art, student: bob, grade: 3.4)
    art_dan = CourseStudent.create!(course: art, student: dan, grade: 3.8)

    visit course_path(art.id)

    within "#student-#{dan.id}" do
      expect(page).to have_content("Student: #{dan.name}")
      expect(page).to have_content("Grade: #{art_dan.grade}")
      expect(page).to have_button('Unenroll')
    end

    within "#student-#{bob.id}" do
      expect(page).to have_content("Student: #{bob.name}")
      expect(page).to have_content("Grade: #{art_bob.grade}")
      expect(page).to have_button('Unenroll')
    end
  end
end

# As a user,
# When I visit a course show page,
# Then I see a button 'unenroll' next to each student's name
# When I click this button,
# Then I am redirected to that student's show page where I do not see the course listed
