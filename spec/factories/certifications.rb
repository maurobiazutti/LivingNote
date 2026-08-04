FactoryBot.define do
  factory :certification do
    association :profile
    name { Faker::Educator.course_name }
    issuer { Faker::Company.name }
    issue_date { Faker::Date.between(from: 3.years.ago, to: Date.current) }
  end
end
