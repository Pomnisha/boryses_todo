require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :tname => "MyString",
      :tdescription => "",
      :tpriority => "MyString",
      :tstate => "MyString",
      :tasklist_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path, :method => "post" do
      assert_select "input#task_tname", :name => "task[tname]"
      assert_select "input#task_tdescription", :name => "task[tdescription]"
      assert_select "input#task_tpriority", :name => "task[tpriority]"
      assert_select "input#task_tstate", :name => "task[tstate]"
      assert_select "input#task_tasklist_id", :name => "task[tasklist_id]"
      assert_select "input#task_user_id", :name => "task[user_id]"
    end
  end
end
