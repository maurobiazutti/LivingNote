require 'rails_helper'

RSpec.describe 'SkillsController', type: :request do
  let(:user) { create(:user) }
  let(:profile) { create(:profile, user: user) }
  let(:skill) { create(:skill, profile: profile) }

  before do
    sign_in user
    profile
  end

  describe 'POST /profile/skills' do
    context 'com atributos válidos' do
      it 'cria a skill' do
        expect do
          post profile_skills_path, params: {
            skill: attributes_for(:skill)
          }
        end.to change(Skill, :count).by(1)
      end
    end

    context 'com atributos inválidos' do
      it 're-renderiza o form com erro' do
        expect do
          post profile_skills_path, params: {
            skill: { name: '' }
          }
        end.not_to change(Skill, :count)
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe 'PATCH /profile/skills/:id' do
    it 'atualiza a skill' do
      patch profile_skill_path(skill), params: {
        skill: { name: 'Ruby on Rails', level: 'Avançado' }
      }
      expect(skill.reload.name).to eq('Ruby on Rails')
      expect(skill.reload.level).to eq('Avançado')
    end
  end

  describe 'DELETE /profile/skills/:id' do
    it 'exclui a skill' do
      skill
      expect do
        delete profile_skill_path(skill)
      end.to change(Skill, :count).by(-1)
    end
  end
end
