require 'spec_helper'

describe PagesController do
  it "should show BDD of todo list on about page" do
     get '/pages/about'
     responce.should be_success
     responce.should have_selector("h1", :content => "ToDo Description")
  end
end
