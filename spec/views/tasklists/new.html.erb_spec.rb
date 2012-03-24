require 'spec_helper'

describe "tasklists/new" do
  before(:each) do
    assign(:tasklist, stub_model(Tasklist,
      :tlname => "MyString",
      :tldescription => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new tasklist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => project_tasklists_path, :method => "post" do
      assert_select "input#tasklist_tlname", :name => "tasklist[tlname]"
      assert_select "input#tasklist_tldescription", :name => "tasklist[tldescription]"
      assert_select "input#tasklist_user_id", :name => "tasklist[user_id]"
    end
  end
end
