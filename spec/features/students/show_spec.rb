require 'rails_helper'

RSpec.describe 'Student Show Page' do
  it 'displays name of student, their enrolled courses and grade by course' do
    art = Course.create!(name: 'Art')
    math = Course.create!(name: 'Music')

    bob = Student.create!(name: 'Tom')

    art_bob = CourseStudent.create!(course: art, student: bob, grade: 3.8)
    math_bob = CourseStudent.create!(course: math, student: bob, grade: 3.6)

    visit "/students/#{bob.id}"

    expect(page).to have_content(bob.name)

    within "course-#{art.id}" do
      expect(page).to have_content(art.name)
      expect(page).to have_content(art_bob.grade)
    end

    within "course-#{math.id}" do
      expect(page).to have_content(math.name)
      expect(page).to have_content(math_bob.grade)
    end
  end
end
