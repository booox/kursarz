FactoryGirl.define do
  factory :user do
    sequence(:uid) { |n| n }
    sequence(:login) { |n| "example#{n}" }
    name { "Sample name" }
    provider { 'github' }
  end

  factory :course do
    name { 'Example course' }
    short_description { 'Very short description' }
    description { 'Full detailed description' }
  end
end
