require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new
  end

  describe 'required fields' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should allow_value('aldsjfhlausdfualsdjfhal@dashkfjasd.com').for(:email)}
    it {should_not allow_value('aldsjfhlausdfualsdjfhal@@dashkfjasd.com').for(:email)}
    it {should_not allow_value('aldsjfhlausdfualsdjfhal@dashkfjasd').for(:email)}
    it {should validate_presence_of(:password)}
  end

  describe 'associations' do
    it {should have_many(:projects)}
  end

  describe 'additional fields' do
    it 'should have involved_into filed to identify the list of projects user is involved in' do
      pending 'waiting for Factory Girl'
    end

    it 'should have to_do filed to identify the list tasks user is expected to do' do
      pending 'waiting for Factory Girl'
    end

  end
end
