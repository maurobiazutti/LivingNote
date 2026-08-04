require 'rails_helper'

RSpec.describe Certification, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:profile) }
  end

  describe 'validations' do
    subject { build(:certification) }

    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'criação válida' do
    it 'é válido com atributos corretos' do
      expect(build(:certification)).to be_valid
    end
  end
end
