# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    name "MyString"
    short_description "MyString"
    description "MyText"
    course_id 1
    screenshot_url "MyString"
  end
end
