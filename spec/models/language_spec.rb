require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:profile) }
  end

  describe 'criação válida' do
    it 'é válido com atributos corretos' do
      expect(build(:language)).to be_valid
    end
  end
end
