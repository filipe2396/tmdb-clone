FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }

    trait :with_favorites do
      after(:create) do |user|
        create(:user_movie, user: user)
      end
    end
  end
end
