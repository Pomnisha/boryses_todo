require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :name => "MyString",
      :description => "MyText",
      :tasklist_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "input#project_tasklist_id", :name => "project[tasklist_id]"
      assert_select "input#project_user_id", :name => "project[user_id]"
    end
  end
end
