FactoryBot.define do
  factory :project do
    users
    sequence(:name) { |n| "Project##{n}" }
    description  { Faker::Lorem.paragraph }
  end
end
