require 'rails_helper'

RSpec.describe 'CertificationsController', type: :request do
  let(:user) { create(:user) }
  let(:profile) { create(:profile, user: user) }
  let(:certification) { create(:certification, profile: profile) }

  before do
    sign_in user
    profile
  end

  describe 'POST /profile/certifications' do
    context 'com atributos válidos' do
      it 'cria a certificação' do
        expect do
          post profile_certifications_path, params: {
            certification: attributes_for(:certification)
          }
        end.to change(Certification, :count).by(1)
      end
    end

    context 'com atributos inválidos' do
      it 're-renderiza o form com erro' do
        expect do
          post profile_certifications_path, params: {
            certification: { name: '', issuer: '' }
          }
        end.not_to change(Certification, :count)
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe 'PATCH /profile/certifications/:id' do
    context 'com atributos válidos' do
      it 'atualiza a certificação' do
        patch profile_certification_path(certification), params: {
          certification: { name: 'AWS Certified Solutions Architect' }
        }
        expect(certification.reload.name).to eq('AWS Certified Solutions Architect')
      end
    end
  end

  describe 'DELETE /profile/certifications/:id' do
    it 'exclui a certificação' do
      certification
      expect do
        delete profile_certification_path(certification)
      end.to change(Certification, :count).by(-1)
    end
  end
end
