require "spec_helper"

describe SharingProjectsController do
  describe "routing" do

    it "routes to #index" do
      get("/sharing_projects").should route_to("sharing_projects#index")
    end

    it "routes to #new" do
      get("/sharing_projects/new").should route_to("sharing_projects#new")
    end

    it "routes to #show" do
      get("/sharing_projects/1").should route_to("sharing_projects#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sharing_projects/1/edit").should route_to("sharing_projects#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sharing_projects").should route_to("sharing_projects#create")
    end

    it "routes to #update" do
      put("/sharing_projects/1").should route_to("sharing_projects#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sharing_projects/1").should route_to("sharing_projects#destroy", :id => "1")
    end

  end
end
