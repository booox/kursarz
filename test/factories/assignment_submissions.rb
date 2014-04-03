# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment_submission do
    user_id 1
    assignment_id 1
    output "MyText"
  end
end
