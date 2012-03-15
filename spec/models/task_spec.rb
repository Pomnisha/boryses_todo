require 'spec_helper'

describe Task do
describe 'required fields' do
  before(:each) do
    @task = Task.new
  end

  params = [:tname, :tdescription, :tpriority, :tstate]

  params.each do |p|
    it "should require #{p.to_s[1..p.to_s.length]}" do
      @task.should_not be_valid
      @task.errors[p].should_not be_nil
    end
  end

  it {should validate_presence_of(:tasklist_id)}
end

describe 'associations' do
  it {should belong_to(:tasklist)}
end
end
