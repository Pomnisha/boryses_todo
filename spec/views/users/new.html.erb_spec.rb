require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :fname => "MyString",
      :lname => "MyString",
      :mname => "MyString",
      :gender => "MyString",
      :password => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_fname", :name => "user[fname]"
      assert_select "input#user_lname", :name => "user[lname]"
      assert_select "input#user_mname", :name => "user[mname]"
      assert_select "input#user_gender", :name => "user[gender]"
      assert_select "input#user_password", :name => "user[password]"
    end
  end
end
