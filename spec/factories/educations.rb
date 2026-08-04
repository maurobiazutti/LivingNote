FactoryBot.define do
  factory :education do
    association :profile
    institution { Faker::University.name }
    degree { Faker::Educator.degree }
    course { Faker::Educator.subject }
    start_date { Faker::Date.between(from: 5.years.ago, to: 2.years.ago) }
    end_date { Faker::Date.between(from: 23.months.ago, to: Date.current) }
  end
end
