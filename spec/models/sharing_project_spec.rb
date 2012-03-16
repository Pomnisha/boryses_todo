require 'spec_helper'

describe SharingProject do
  describe 'required fields' do
    before(:each) do
      @sp = SharingProject.new
    end

    it {should validate_presence_of(:project_id)}
    it {should validate_presence_of(:user_id)}
  end

  describe 'associations' do
    it {should belong_to(:project)}
    it {should belong_to(:user)}
  end
end
