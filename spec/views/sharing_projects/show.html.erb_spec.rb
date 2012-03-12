require 'spec_helper'

describe "sharing_projects/show" do
  before(:each) do
    @sharing_project = assign(:sharing_project, stub_model(SharingProject,
      :user_id => 1,
      :project_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
