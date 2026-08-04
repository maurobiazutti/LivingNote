require 'rails_helper'

RSpec.describe 'LanguagesController', type: :request do
  let(:user) { create(:user) }
  let(:profile) { create(:profile, user: user) }
  let(:language) { create(:language, profile: profile) }

  before do
    sign_in user
    profile
  end

  describe 'POST /profile/languages' do
    context 'com atributos válidos' do
      it 'cria o idioma' do
        expect do
          post profile_languages_path, params: {
            language: attributes_for(:language)
          }
        end.to change(Language, :count).by(1)
      end
    end

    context 'com atributos inválidos' do
      it 're-renderiza o form com erro' do
        expect do
          post profile_languages_path, params: {
            language: { name: '' }
          }
        end.not_to change(Language, :count)
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe 'PATCH /profile/languages/:id' do
    it 'atualiza o idioma' do
      patch profile_language_path(language), params: {
        language: { name: 'Inglês', level: 'Fluente' }
      }
      expect(language.reload.name).to eq('Inglês')
      expect(language.reload.level).to eq('Fluente')
    end
  end

  describe 'DELETE /profile/languages/:id' do
    it 'exclui o idioma' do
      language
      expect do
        delete profile_language_path(language)
      end.to change(Language, :count).by(-1)
    end
  end
end
