require 'rails_helper'

RSpec.describe Experience, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:profile) }
  end

  describe 'validations' do
    subject { build(:experience) }

    it { is_expected.to validate_presence_of(:company) }
    it { is_expected.to validate_presence_of(:position) }
    it { is_expected.to validate_presence_of(:start_date) }
  end

  describe 'criação válida' do
    it 'é válido com atributos corretos' do
      expect(build(:experience)).to be_valid
    end
  end
end
