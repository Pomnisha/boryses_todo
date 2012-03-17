FactoryGirl.define do
  factory :tasklist do
    sequence(:tlname) { |n| puts "Tasklist ##{n}" }
    sequence(:tldescription) { |n| puts "Description for tasklist ##{n}" }
  end
end