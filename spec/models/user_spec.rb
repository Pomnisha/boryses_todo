require 'spec_helper'

describe User do
  describe 'required fields' do
    it {should validate_presence_of(:email)}
    it {@user = User.create(:email => "mail@gmail.com", :password => "password1")
        should validate_uniqueness_of(:email)}
    it {should allow_value('aldsjfhlausdfualsdjfhal@dashkfjasd.com').for(:email)}
    it {should_not allow_value('aldsjfhlausdfualsdjfhal@@dashkfjasd.com').for(:email)}
    it {should_not allow_value('aldsjfhlausdfualsdjfhal@dashkfjasd').for(:email)}
    it {should validate_presence_of(:password)}
  end

  describe 'associations' do
    it {should have_many(:projects)}
    it {should have_many(:tasks_todo)}
    it {should have_many(:involved_into)}
  end

  describe 'additional fields:' do
    describe "should have composite field username to render" do
      it "email address if first name, last name and middle name are not specified" do
        @user = User.create(:email => "mail@gmail.com", :password => "password1")
        @user.username.eql? "mail@gmail.com"
      end
      it "username if at least one of first name, last name or middle name is specified" do
        @user = User.create(:email => "mail123@gmail.ru", :password => "!password$1", :lname => "Ivanov", :fname => "Ivan", :mname => "Ivanovich")
        @user.username.eql? "Ivan I. Ivanov"
      end
    end

    describe "should have tasks_todo_in to" do
      it "list all tasks assigned for user to perform in project if parameter is kind of project" do
        pending
      end
      it "list all tasks assigned for user to perform in tasklist if parameter is kind of tasklist" do
        pending
      end

    end



  end
end
