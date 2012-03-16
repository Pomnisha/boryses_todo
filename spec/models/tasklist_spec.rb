require 'spec_helper'

describe Tasklist do
  describe 'required fields' do
    before(:each) do
      @tasklist = Tasklist.new
    end

    params = [:tlname, :tldescription]

    params.each do |p|
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
end
