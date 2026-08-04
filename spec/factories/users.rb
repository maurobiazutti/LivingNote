FactoryBot.define do
  sequence(:user_email) { |n| "usuario#{n}@example.com" }

  factory :user do
    email { generate(:user_email) }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
