class Address < ApplicationRecord
  belongs_to :profile

  validates :street, :city, :number, :state, :zip_code, presence: true
end

# CRIAR TESTES COM RSPEC PARA VALIDAR O MODELO ADDRESS.
# INTEGRA API CEP PARA VALIDAR O CEP INFORMADO NO CAMPO ZIP_CODE E 
# COMPLETAR OS DEMAIS CAMPOS DE ENDEREÇO (STREET, CITY, STATE) AUTOMATICAMENTE.