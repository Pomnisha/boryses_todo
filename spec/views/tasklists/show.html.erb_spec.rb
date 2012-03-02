require 'spec_helper'

describe "tasklists/show" do
  before(:each) do
    @tasklist = assign(:tasklist, stub_model(Tasklist,
      :tlname => "Tlname",
      :tldescription => "Tldescription",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tlname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tldescription/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
