require 'rails_helper'

RSpec.describe 'EducationsController', type: :request do
  let(:user) { create(:user) }
  let(:profile) { create(:profile, user: user) }
  let(:education) { create(:education, profile: profile) }

  before do
    sign_in user
    profile
  end

  describe 'GET /profile/educations' do
    context 'quando autenticado' do
      it 'retorna sucesso e lista as formações' do
        education
        get profile_educations_path
        expect(response).to have_http_status(:ok)
        expect(response.body).to include(education.institution)
      end
    end

    context 'quando não autenticado' do
      it 'redireciona para login' do
        sign_out user
        get profile_educations_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET /profile/educations/new' do
    it 'retorna sucesso' do
      get new_profile_education_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /profile/educations' do
    context 'com atributos válidos' do
      it 'cria a formação e redireciona' do
        expect do
          post profile_educations_path, params: {
            education: attributes_for(:education)
          }
        end.to change(Education, :count).by(1)
        expect(response).to redirect_to(profile_educations_path)
      end
    end

    context 'com atributos inválidos' do
      it 're-renderiza o form com erro' do
        expect do
          post profile_educations_path, params: {
            education: { institution: '', degree: '', start_date: nil }
          }
        end.not_to change(Education, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /profile/educations/:id/edit' do
    it 'retorna sucesso' do
      get edit_profile_education_path(education)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PATCH /profile/educations/:id' do
    context 'com atributos válidos' do
      it 'atualiza a formação' do
        patch profile_education_path(education), params: {
          education: { degree: 'Mestrado em Engenharia' }
        }
        expect(education.reload.degree).to eq('Mestrado em Engenharia')
        expect(response).to redirect_to(profile_educations_path)
      end
    end

    context 'com atributos inválidos' do
      it 're-renderiza o form com erro' do
        patch profile_education_path(education), params: {
          education: { institution: '' }
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /profile/educations/:id' do
    it 'exclui a formação e redireciona' do
      education
      expect do
        delete profile_education_path(education)
      end.to change(Education, :count).by(-1)
      expect(response).to redirect_to(profile_educations_path)
    end
  end
end
