require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :course_students }
    it { should have_many(:students).through(:course_students) }
  end

  describe 'instance methods' do
    it 'rank_grades' do
      art = Course.create!(name: 'Art')

      bob = Student.create!(name: 'Bob')
      dan = Student.create!(name: 'Dan')
      lou = Student.create!(name: 'Lou')

      art_bob = CourseStudent.create!(course: art, student: bob, grade: 3.4)
      art_dan = CourseStudent.create!(course: art, student: dan, grade: 3.8)
      art_lou = CourseStudent.create!(course: art, student: lou, grade: 3.6)

      expect(art.rank_grades).to eq([dan, lou, bob])
    end
  end
end
