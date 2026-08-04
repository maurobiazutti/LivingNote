require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one(:address).dependent(:destroy) }
    it { is_expected.to have_many(:experiences).dependent(:destroy) }
    it { is_expected.to have_many(:educations).dependent(:destroy) }
    it { is_expected.to have_many(:skills).dependent(:destroy) }
    it { is_expected.to have_many(:languages).dependent(:destroy) }
    it { is_expected.to have_many(:certifications).dependent(:destroy) }
    it { is_expected.to have_many(:social_links).dependent(:destroy) }
    it { is_expected.to have_many(:resumes).dependent(:destroy) }

    it { is_expected.to accept_nested_attributes_for(:social_links).allow_destroy(true) }
  end

  describe 'validations' do
    subject { build(:profile) }

    it { is_expected.to validate_presence_of(:full_name).with_message('deve ser preenchido obrigatoriamente') }
    it { is_expected.to validate_uniqueness_of(:cpf).ignoring_case_sensitivity }
  end

  describe 'normalização de CPF' do
    it 'remove caracteres não numéricos antes de salvar' do
      profile = build(:profile, cpf: '529.982.247-25')
      profile.save!
      expect(profile.reload.cpf).to eq('52998224725')
    end
  end

  describe 'validação de CPF' do
    it 'rejeita CPF inválido' do
      profile = build(:profile, cpf: '111.111.111-11')
      expect(profile).not_to be_valid
    end

    it 'é válido com CPF válido' do
      expect(build(:profile, cpf: CPF.generate)).to be_valid
    end
  end

  describe 'traits' do
    it 'cria perfil com endereço' do
      profile = create(:profile, :with_address)
      expect(profile.address).to be_present
    end

    it 'cria perfil com experiência' do
      profile = create(:profile, :with_experience)
      expect(profile.experiences).not_to be_empty
    end

    it 'cria perfil com formação acadêmica' do
      profile = create(:profile, :with_education)
      expect(profile.educations).not_to be_empty
    end

    it 'cria perfil com habilidade' do
      profile = create(:profile, :with_skill)
      expect(profile.skills).not_to be_empty
    end

    it 'cria perfil com idioma' do
      profile = create(:profile, :with_language)
      expect(profile.languages).not_to be_empty
    end

    it 'cria perfil com certificação' do
      profile = create(:profile, :with_certification)
      expect(profile.certifications).not_to be_empty
    end

    it 'cria perfil com link social' do
      profile = create(:profile, :with_social_link)
      expect(profile.social_links).not_to be_empty
    end

    it 'cria perfil com currículo' do
      profile = create(:profile, :with_resume)
      expect(profile.resumes).not_to be_empty
    end
  end
end
