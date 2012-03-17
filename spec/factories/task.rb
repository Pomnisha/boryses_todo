FactoryGirl.define do
  factory :task do
    sequence(:tname) {|n| puts "Task ##{n}"}
    sequence(:tdescription) {|n| puts "Description for Task ##{n}"}
    tpriority => "routine"
    tstate => "open"
  end
end