require 'rails_helper'

RSpec.describe SocialLink, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:profile) }
  end

  describe 'validations' do
    subject { build(:social_link) }

    it { is_expected.to validate_presence_of(:platform) }
    it { is_expected.to validate_presence_of(:url) }
  end

  describe 'criação válida' do
    it 'é válido com atributos corretos' do
      expect(build(:social_link)).to be_valid
    end
  end
end
