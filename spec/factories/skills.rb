FactoryBot.define do
  factory :skill do
    association :profile
    name { Faker::Job.key_skill }
    level { %w[Básico Intermediário Avançado].sample }
  end
end
