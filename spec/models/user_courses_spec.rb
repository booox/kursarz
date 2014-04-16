require 'spec_helper'

describe 'User signing up for courses' do
  it 'should create new student course role' do
    user = create(:user)
    course = create(:course)

    expect{
      user.sign_up_for(course)
    }.to change{user.signup_courses.count}.by(1)
  end

  it 'when user is already signed it should not create new course role' do
    user = create(:user)
    course = create(:course)

    user.sign_up_for(course)

    expect(user.sign_up_for(course)).to eq false

    expect{
      user.sign_up_for(course)
    }.to change{ user.signup_courses.count }.by(0)
  end
end
