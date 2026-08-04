FactoryBot.define do
  factory :profile do
    association :user
    full_name { Faker::Name.name }
    username { Faker::Internet.username(specifier: 8..20) }
    cpf { CPF.generate }
    phone { Faker::PhoneNumber.cell_phone }
    bio { Faker::Lorem.paragraph }

    trait :with_address do
      address
    end

    trait :with_experience do
      after(:create) { |profile| create(:experience, profile: profile) }
    end

    trait :with_education do
      after(:create) { |profile| create(:education, profile: profile) }
    end

    trait :with_skill do
      after(:create) { |profile| create(:skill, profile: profile) }
    end

    trait :with_language do
      after(:create) { |profile| create(:language, profile: profile) }
    end

    trait :with_certification do
      after(:create) { |profile| create(:certification, profile: profile) }
    end

    trait :with_social_link do
      after(:create) { |profile| create(:social_link, profile: profile) }
    end

    trait :with_resume do
      after(:create) { |profile| create(:resume, profile: profile) }
    end
  end
end
