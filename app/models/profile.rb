class Profile < ApplicationRecord
  before_validation :normalize_cpf

  belongs_to :user
  has_one :address, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_many :certifications, dependent: :destroy
  has_many :social_links, dependent: :destroy
  has_many :resumes, dependent: :destroy

  validates :full_name, presence: { message: "deve ser preenchido obrigatoriamente" }
  validates :cpf,
              presence: true,
              uniqueness: true,
              cpf: true

  private

  def normalize_cpf
    self.cpf = cpf.gsub(/\D/, "") if cpf.present?
  end
end


# CRIAR TESTES COM RSPEC PARA VALIDAR O MODELO PROFILE.
