class Profile < ApplicationRecord
  before_validation :normalize_cpf
  
  belongs_to :user
 
  validates :full_name, presence: { message: "deve ser preenchido obrigatoriamente" }
  validates :cpf,
            presence: true,
            uniqueness: true,
            cpf: true

  private

  def normalize_cpf
    self.cpf = CPF.strip(cpf) if cpf.present?
  end
end
  

# CRIAR TESTES COM RSPEC PARA VALIDAR O MODELO PROFILE. 