FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project##{n}" }
    description  { Faker::Lorem.paragraph }
    users = []
  end
end
