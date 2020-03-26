FactoryBot.define do
  factory :blog do
    title { Faker::Lorem.characters(number:5) }
    body { Faker::Lorem.characters(number:10) }
  end
end
