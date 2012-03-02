require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :fname => "Fname",
      :lname => "Lname",
      :mname => "Mname",
      :gender => "Gender",
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Lname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Mname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Gender/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Password/)
  end
end
