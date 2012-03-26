require 'spec_helper'

describe Project do
  before(:each) do
    @proj = Project.new
  end

  describe 'required fields' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:owner_id)}
  end

  describe 'associations' do
    it "should require user as owner set" do
      @proj.should_not be_valid
      @proj.errors[:owner].should_not be_nil
    end

    it {should have_many(:tasklists)}
    it {should have_many(:sharing_projects)}
    it {should have_many(:users).through(:sharing_projects)}
    it {should have_many(:tasks).through(:tasklists) }

  end

  describe 'additional fields:' do
    it 'should have collaborators' do
      pending 'waiting for THE ANSWER'
    end

    Task::TASK_STATES.each do |s|
      it "should have fields '#{s}' to list tasks in #{s} state " do
        pending 'waiting for THE ANSWER'
      end
    end
    it "should have fields 'stat' to show completeness of the project " do
      pending 'waiting for THE ANSWER'
    end

  end
end
