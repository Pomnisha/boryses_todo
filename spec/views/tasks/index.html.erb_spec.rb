require 'spec_helper'

describe "tasks/index" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task,
        :tname => "Tname",
        :tdescription => "",
        :tpriority => "Tpriority",
        :tstate => "Tstate",
        :tasklist_id => 1,
        :user_id => 1
      ),
      stub_model(Task,
        :tname => "Tname",
        :tdescription => "",
        :tpriority => "Tpriority",
        :tstate => "Tstate",
        :tasklist_id => 1,
        :user_id => 1
      )
    ])
  end

  it "renders a list of tasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tpriority".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tstate".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
