FactoryBot.define do
  factory :address do
    association :profile
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    district { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip_code { "01001-000" }
    country { "Brasil" }
  end
end
