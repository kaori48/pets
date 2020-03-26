FactoryBot.define do
  factory :user do
    name { '12345' }
    email { Faker::Internet.email }
    password { '123456' }
  end
end
