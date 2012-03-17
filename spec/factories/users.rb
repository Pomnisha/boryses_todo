FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    lname "Rashba"
    fname "Boris"
    email {Factory.next(:email)}
    password "password1"
    password_confirmation "password1"
  end


end

