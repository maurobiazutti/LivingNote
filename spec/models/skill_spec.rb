require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:profile) }
  end

  describe 'validations' do
    subject { build(:skill) }

    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'criação válida' do
    it 'é válido com atributos corretos' do
      expect(build(:skill)).to be_valid
    end
  end
end
