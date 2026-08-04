require 'rails_helper'

RSpec.describe Resume, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:profile) }
  end

  describe 'validations' do
    subject { build(:resume) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:objective) }
  end

  describe 'limite de currículos por perfil' do
    it 'permite criar até 3 currículos' do
      profile = create(:profile)
      3.times { create(:resume, profile: profile) }

      fourth = build(:resume, profile: profile)
      expect(fourth).not_to be_valid
      expect(fourth.errors[:base]).to include('Você pode criar no máximo 3 currículos.')
    end

    it 'permitir que o terceiro currículo salve normalmente' do
      profile = create(:profile)
      2.times { create(:resume, profile: profile) }

      expect(build(:resume, profile: profile)).to be_valid
    end
  end
end
