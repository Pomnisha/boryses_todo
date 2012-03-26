require 'spec_helper'

describe Tasklist do
  describe 'required fields' do
    before(:each) do
      @tasklist = Tasklist.new
    end

    [:tlname, :tldescription].each do |p|
      it "should require #{p.to_s[2..p.to_s.length]}" do
        @tasklist.should_not be_valid
        @tasklist.errors[p].should_not be_nil
      end
    end

    it {should validate_presence_of(:project_id)}
  end

  describe 'associations' do
    it {should belong_to(:project)}
  end

  describe 'additional fields:' do
    Task::TASK_STATES.each do |s|
      it "should have fields '#{s}' to list tasks in #{s} state" do
        pending 'waiting for THE ANSWER'
      end
    end
    it "should have fields 'stat' to show completeness of the tasklist" do
      pending 'waiting for THE ANSWER'
    end

  end

end
