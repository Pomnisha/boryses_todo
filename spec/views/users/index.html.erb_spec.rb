require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :fname => "Fname",
        :lname => "Lname",
        :mname => "Mname",
        :gender => "Gender",
        :password => "Password"
      ),
      stub_model(User,
        :fname => "Fname",
        :lname => "Lname",
        :mname => "Mname",
        :gender => "Gender",
        :password => "Password"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Fname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
