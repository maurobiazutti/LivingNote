FactoryBot.define do
  factory :resume do
    association :profile
    title { Faker::Lorem.sentence(word_count: 3) }
    objective { Faker::Lorem.paragraph }
  end
end
