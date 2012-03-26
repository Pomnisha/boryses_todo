require 'spec_helper'

describe SharingProject do
  before(:each) do
    @sp = SharingProject.new
  end

=begin
  describe 'required fields' do
    it {should validate_presence_of(:project_id)}
    it {should validate_presence_of(:user_id)}
  end

  describe 'associations' do
    it {should belong_to(:project)}
    it {should belong_to(:user)}
  end
=end
#alternative way
  %w(user project).each do |p|
    it {should validate_presence_of("#{p}_id".to_sym)}
    it {should belong_to(p.to_sym)}
  end
  it "should delegate email to user" do
    pending
  end
end
