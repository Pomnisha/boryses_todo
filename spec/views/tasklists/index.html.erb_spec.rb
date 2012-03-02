require 'spec_helper'

describe "tasklists/index" do
  before(:each) do
    assign(:tasklists, [
      stub_model(Tasklist,
        :tlname => "Tlname",
        :tldescription => "Tldescription",
        :user_id => 1
      ),
      stub_model(Tasklist,
        :tlname => "Tlname",
        :tldescription => "Tldescription",
        :user_id => 1
      )
    ])
  end

  it "renders a list of tasklists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tlname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tldescription".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
