FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| puts "Project ##{n}" }
    sequence(:description) { |n| puts "Description for Project ##{n}" }
  end
end
