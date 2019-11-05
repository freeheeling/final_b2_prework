require 'rails_helper'

RSpec.describe 'Course Unenrollment' do
  it 'the course show page displays a button to unenroll a student next to their name' do
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

  it 'clicking the unenroll button redirects to that student show page where the course is not listed' do
    art = Course.create!(name: 'Art')
    music = Course.create!(name: 'music')

    dan = Student.create!(name: 'Dan')

    art_dan = CourseStudent.create!(course: art, student: dan, grade: 3.8)
    music_dan = CourseStudent.create!(course: music, student: dan, grade: 3.4)

    visit course_path(art.id)

    within "#student-#{dan.id}" do
      expect(page).to have_content("Student: #{dan.name}")
      expect(page).to have_content("Grade: #{art_dan.grade}")
      click_button 'Unenroll'
    end

    expect(current_path).to eq(student_path(dan.id))

    within "#course-#{music.id}" do
      expect(page).to have_content("Course: #{music.name}")
      expect(page).to have_content("Grade: #{music_dan.grade}")
    end

    expect(page).to_not have_content("Course: #{art.name}")
    expect(page).to_not have_content("Grade: #{art_dan.grade}")
  end
end
