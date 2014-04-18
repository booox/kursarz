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

  factory :assignment do
    association :course, factory: :course

    name { "Square assignment" }
    short_description { 'Please compute the square of number' }
    description { 'Please compute the square of numbers' }

    language { "Ruby" }

    code { %q{
describe 'computing square of number' do
  it 'should compute the square of numbers correctly' do
    expect(square(2)).to eq 4
    expect(square(4)).to eq 16
  end
end
    } }
  end

  factory :assignment_submission do
    association :assignment, factory: :assignment

    code { %q{
def square(x)
  x * x
end
    }}

    trait :incorrect_submission do
      code { %q{
def square(x)
  0
end
      }}
    end
  end
end
