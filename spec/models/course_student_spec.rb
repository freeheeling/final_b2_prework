require 'rails_helper'

RSpec.describe CourseStudent, type: :model do
  describe 'validations' do
    it { should validate_presence_of :grade }
  end

  describe 'relationships' do
    it { should belong_to :course }
    it { should belong_to :student }
  end
end
