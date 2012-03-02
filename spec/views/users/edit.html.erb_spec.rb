require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :fname => "MyString",
      :lname => "MyString",
      :mname => "MyString",
      :gender => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_fname", :name => "user[fname]"
      assert_select "input#user_lname", :name => "user[lname]"
      assert_select "input#user_mname", :name => "user[mname]"
      assert_select "input#user_gender", :name => "user[gender]"
      assert_select "input#user_password", :name => "user[password]"
    end
  end
end
