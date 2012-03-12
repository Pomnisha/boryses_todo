require 'spec_helper'

describe "sharing_projects/index" do
  before(:each) do
    assign(:sharing_projects, [
      stub_model(SharingProject,
        :user_id => 1,
        :project_id => 1
      ),
      stub_model(SharingProject,
        :user_id => 1,
        :project_id => 1
      )
    ])
  end

  it "renders a list of sharing_projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
