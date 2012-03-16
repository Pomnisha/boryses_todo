FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    fname "Rashba"
    lname "Boris"
    email {Factory.next(:email)}
    password "password1"
    password_confirmation "password1"
  end


end

