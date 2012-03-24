require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :tname => "MyString",
      :tdescription => "",
      :tpriority => "MyString",
      :tstate => "MyString",
      :tasklist_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path(@task), :method => "post" do
      assert_select "input#task_tname", :name => "task[tname]"
      assert_select "input#task_tdescription", :name => "task[tdescription]"
      assert_select "input#task_tpriority", :name => "task[tpriority]"
      assert_select "input#task_tstate", :name => "task[tstate]"
      assert_select "input#task_tasklist_id", :name => "task[tasklist_id]"
      assert_select "input#task_user_id", :name => "task[user_id]"
    end
  end
end
