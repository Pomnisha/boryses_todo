@user = FactoryGirl.create(:user)
@project = FactoryGirl.create(:project, :owner => @user)

def valid_user
  @user ||=  {email: "test@email.com", password: "!password1", password_confirmation: "!password1"}
end

def invalid_user
  valid_user.merge(:password => "iii")
end
def valid_p_data
  @project ||= {name: "Project#1", description: "Project#1 description..."}
end

def sign_up user
  fill_in "Email", with: user[:email]
  fill_in "Password", with: user[:password]
  fill_in "Password confirmation", with: user[:password_confirmation]
  click_button("Sign up")
end

def sign_in user
  fill_in "Email", with: user[:email]
  fill_in "Password", with: user[:password]
  click_button("Sign in")
end

def create_project project
  fill_in "Name", with: @project[:name]
  fill_in "Description", with: @project[:description]
  click_button("Create Project")
end

Given /^I am not user of the system$/ do

end

When /^I go to main page$/ do
  visit '/'
end

Then /^I see main menu for not signed in users$/ do
  page.should have_content "ToDo Description"
end

Then /^I don't see right menu$/ do
  page.should_not have_content "Activity"
  page.should_not have_content "Your projects"
  page.should_not have_content "You are involved into"
end

Then /^I see my activities menu$/ do
  page.should have_selector("div", :class => 'sidebar') do
    should have_selector("h3", :text => "Activity")
  end
end

Then /^I see about page$/ do
  page.should have_content "ToDo Description"
end

When /^I go to "([^\"]*)" link$/ do |arg1|
    click_link arg1.to_s
end

Then /^I see Sign in form$/ do
  page.should have_selector('form', :class =>'user_new')
  page.should have_selector('input', :id => 'user_email')
  page.should have_selector('input', :id => 'user_password')
  page.should have_selector('input', :type => 'submit', :name => 'Sign in')
end

Then /^I see Sign up form$/ do
  page.should have_selector('form', :class =>'user_new')
  page.should have_selector('input', :id => 'user_email')
  page.should have_selector('input', :id => 'user_password')
  page.should have_selector('input', :id => 'user_password_confirmation')
  page.should have_selector('input', :type => 'submit', :name => 'Sign up')
end

Then /^I see project creation form$/ do
  page.should have_selector('form', :class => 'project_new')
  page.should have_selector('input', :id => 'project_name')
  page.should have_selector('input', :id => 'project_description')
  page.should have_selector('input', :type => 'submit', :name => 'Create Project')
end

When /^I "([^\"]*)" with "([^\"]*)" data$/ do |f, t|
  send(f.to_sym, send(t.to_sym))
end

Then /^I see message "([^"]*)"$/ do |arg1|
    have_content arg1
end

Then /^I can see my homepage$/ do
  page.should have_content(valid_user[:email].to_s)
end

Then /^I see my projects menu with created project in list$/ do
  page.should have_selector("div", :class => 'sidebar') do
    should have_selector("h3", :text => "Activity")
    should have_selector("a", :text => @project.name)
  end
end

Then /^I see created project menu$/ do
  page.should have_selector('a') do
    should have_content("Show taklists")
    should have_content("Edit")
    should have_content("Share")
  end
end

Then /^I see created project main view$/ do
  page.should have_content(@project[:name])
end

Given /^I am signed in user$/ do
  visit '/'
  click_link "Sign up"
  sign_up valid_user
end