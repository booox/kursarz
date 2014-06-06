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

    trait :ruby do

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

    trait :javascript do

      language { "javascript" }

      code { %q{
describe("computing square of number", function() {
  it("should compute the square of numbers correctly", function() {
    expect(square(2)).toBe(4);
    expect(square(4)).toBe(16);
  });
});
      } }
    end
  end

  factory :assignment_submission do
    association :assignment, factory: :assignment

    trait :ruby do

      code { %q{
def square(x)
  x * x
end
      }}

      association :assignment, factory: [:assignment, :ruby]
    end

    trait :ruby_incorrect do
      code { %q{
def square(x)
  0
end
      }}

      association :assignment, factory: [:assignment, :ruby]
    end

    trait :javascript do

      code { %q{
function square(x) {
  return x * x;
}
      }}

      association :assignment, factory: [:assignment, :ruby]
    end

    trait :javascript_incorrect do

      code { %q{
function square(x) {
  return 0;
}
    }}

      association :assignment, factory: [:assignment, :ruby]
    end
  end
end
