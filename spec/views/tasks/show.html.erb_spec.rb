require 'spec_helper'

describe "tasks/show" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :tname => "Tname",
      :tdescription => "",
      :tpriority => "Tpriority",
      :tstate => "Tstate",
      :tasklist_id => 1,
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tpriority/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tstate/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
