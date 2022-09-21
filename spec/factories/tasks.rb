FactoryBot.define do
  factory :task do
    project
    sequence(:title) { |n| "Task##{n}" }
    description  { Faker::Lorem.paragraph }
    deadline_at { 'September 02, 2022 18:20' }
  end
end
