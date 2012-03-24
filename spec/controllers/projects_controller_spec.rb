require 'spec_helper'

describe ProjectsController do

  @user
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user, :mname => "A")

    sign_in @user
  end

  # This should return the minimal set of attributes required to create a valid
  # Project. As you add validations to Project, be sure to
  # update the return value of this method accordingly.

  def valid_attributes
    {
        :name => "Project #1",
        :description => "Description of project #1",
        :owner_id => @user.id
    }
  end

  describe "GET new" do
    it "assigns a new project as @project" do
      get :new, {}
      assigns(:project).should be_a_new(Project)
    end
  end

  describe "GET edit" do
    it "assigns the requested project as @project" do
      sign_in @user
      project = Project.create! valid_attributes
      get :edit, {:id => project.to_param}
      assigns(:project).should eq(project)
    end
  end

  describe "POST create" do
    describe "with valid params" do

      it "creates a new Project" do
        expect {
          post :create, {:project => valid_attributes}
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, {:project => valid_attributes}
        assigns(:project).should be_a(Project)
        assigns(:project).should be_persisted
      end

      it "redirects to the  user main view" do
        post :create, {:project => valid_attributes}
        response.should redirect_to(@project)
      end
    end
  end

    describe "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        post :create, {:project => {}}
        assigns(:project).should be_a_new(Project)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        post :create, {:project => {}}
        response.should render_template("new")
      end

  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested project" do
        project = Project.create! valid_attributes
        # Assuming there are no other projects in the database, this
        # specifies that the Project created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Project.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => project.to_param, :project => {'these' => 'params'}}
      end

      it "assigns the requested project as @project" do
        project = Project.create! valid_attributes
        put :update, {:id => project.to_param, :project => valid_attributes}
        assigns(:project).should eq(project)
      end

      it "redirects to the project's main view" do
        project = Project.create! valid_attributes
        put :update, {:id => project.to_param, :project => valid_attributes}
        response.should redirect_to(@project)
      end
    end

    describe "with invalid params" do
      it "assigns the project as @project" do
        project = Project.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        put :update, {:id => project.to_param, :project => {}}
        assigns(:project).should eq(project)
      end

      it "re-renders the 'edit' template" do
        project = Project.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        put :update, {:id => project.to_param, :project => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested project" do
      project = Project.create! valid_attributes
      expect {
        delete :destroy, {:id => project.to_param}
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the user main view" do
      project = Project.create! valid_attributes
      delete :destroy, {:id => project.to_param}
      response.should redirect_to(@user)
    end
  end

end
