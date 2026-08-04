FactoryBot.define do
  factory :experience do
    association :profile
    company { Faker::Company.name }
    position { Faker::Job.title }
    start_date { Faker::Date.between(from: 5.years.ago, to: 1.year.ago) }
    end_date { Faker::Date.between(from: 11.months.ago, to: Date.current) }
    description { Faker::Lorem.paragraph }
  end
end
