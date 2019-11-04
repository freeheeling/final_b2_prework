require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :course_students }
    it { should have_many(:courses).through(:course_students) }
  end

  describe 'instance methods' do
    it 'grade' do
      art = Course.create!(name: 'Art')
      bob = Student.create!(name: 'Bob')
      art_bob = CourseStudent.create!(course: art, student: bob, grade: 3.8)

      expect(bob.grade(art)).to eq(art_bob.grade)
    end
  end
end
