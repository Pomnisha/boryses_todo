require 'spec_helper'

describe "sharing_projects/edit" do
  before(:each) do
    @sharing_project = assign(:sharing_project, stub_model(SharingProject,
      :user_id => 1,
      :project_id => 1
    ))
  end

  it "renders the edit sharing_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sharing_projects_path(@sharing_project), :method => "post" do
      assert_select "input#sharing_project_user_id", :name => "sharing_project[user_id]"
      assert_select "input#sharing_project_project_id", :name => "sharing_project[project_id]"
    end
  end
end
