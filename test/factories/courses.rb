# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    name "MyString"
    category_id 1
    description "MyText"
    screencast_url "MyString"
  end
end
