FactoryBot.define do
  factory :social_link do
    association :profile
    platform { %w[GitHub LinkedIn Twitter Instagram].sample }
    url { Faker::Internet.url }
  end
end
