require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:profile).dependent(:destroy) }
  end

  describe 'validations' do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe 'devise' do
    it 'autentica com credenciais válidas' do
      user = create(:user, password: 'Senha@123', password_confirmation: 'Senha@123')
      expect(user.valid_password?('Senha@123')).to be(true)
    end

    it 'não autentica com senha incorreta' do
      user = create(:user)
      expect(user.valid_password?('senha-errada')).to be(false)
    end

    it 'deixa o encrypted_password diferente de nil' do
      expect(build(:user).encrypted_password).to be_present
    end
  end
end
