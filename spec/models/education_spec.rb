require 'rails_helper'

RSpec.describe Education, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:profile) }
  end

  describe 'validations' do
    subject { build(:education) }

    it { is_expected.to validate_presence_of(:institution) }
    it { is_expected.to validate_presence_of(:degree) }
    it { is_expected.to validate_presence_of(:start_date) }
  end

  describe 'criação válida' do
    it 'é válido com atributos corretos' do
      expect(build(:education)).to be_valid
    end
  end
end
