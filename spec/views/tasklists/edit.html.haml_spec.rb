require 'spec_helper'

describe "tasklists/edit" do
  before(:each) do
    @tasklist = assign(:tasklist, stub_model(Tasklist,
      :tlname => "MyString",
      :tldescription => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit tasklist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => project_tasklists_path(@tasklist), :method => "post" do
      assert_select "input#tasklist_tlname", :name => "tasklist[tlname]"
      assert_select "input#tasklist_tldescription", :name => "tasklist[tldescription]"
      assert_select "input#tasklist_user_id", :name => "tasklist[user_id]"
    end
  end
end
