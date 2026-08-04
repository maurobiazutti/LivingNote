FactoryBot.define do
  factory :language do
    association :profile
    name { Faker::Nation.language }
    level { %w[Básico Intermediário Avançado Fluente Nativo].sample }
  end
end
