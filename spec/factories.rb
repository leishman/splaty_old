FactoryGirl.define do
  factory :user do
    username { Faker::Lorem.word }
    email { Faker::Internet.email }
  end
end