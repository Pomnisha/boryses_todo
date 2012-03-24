require 'spec_helper'

describe TasklistsController do
  @user
  @project

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user, :mname => "A")
    sign_in @user
    @project = FactoryGirl.create(:project, :owner => @user)
  end

  def valid_attributes
    {
        :tlname => "TaskList #1",
        :tldescription => "Description of tasklist #1",
        :project_id => @project.id
    }
  end

  describe "GET index" do
    it "assigns all tasklists as @tasklists" do
      tasklist = Tasklist.create! valid_attributes
      get :index, {:project_id => @project.id}
      assigns(:tasklists).should eq([tasklist])
    end
  end

  describe "GET show" do
    it "assigns the requested tasklist as @tasklist" do
      tasklist = Tasklist.create! valid_attributes
      get :show, { :project_id => @project.id, :id => tasklist.to_param}
      assigns(:tasklist).should eq(tasklist)
    end
  end

  describe "GET new" do
    it "assigns a new tasklist as @tasklist" do
      get :new, {:project_id => @project.id}
      assigns(:tasklist).should be_a_new(Tasklist)
    end
  end

  describe "GET edit" do
    it "assigns the requested tasklist as @tasklist" do
      tasklist = Tasklist.create! valid_attributes
      get :edit, {:project_id => @project.id, :id => tasklist.to_param}
      assigns(:tasklist).should eq(tasklist)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Tasklist" do
        expect {
          post :create, {:project_id => @project.id, :tasklist => valid_attributes}
        }.to change(Tasklist, :count).by(1)
      end

      it "assigns a newly created tasklist as @tasklist" do
        post :create, {:project_id => @project.id, :tasklist => valid_attributes}
        assigns(:tasklist).should be_a(Tasklist)
        assigns(:tasklist).should be_persisted
      end

      it "redirects to the created tasklist" do
        post :create, {:project_id => @project.id, :tasklist => valid_attributes}
        response.should redirect_to(project_tasklist_path(@project))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tasklist as @tasklist" do
        # Trigger the behavior that occurs when invalid params are submitted
        Tasklist.any_instance.stub(:save).and_return(false)
        post :create, {:project_id => @project.id, :tasklist => {}}
        assigns(:tasklist).should be_a_new(Tasklist)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Tasklist.any_instance.stub(:save).and_return(false)
        post :create, {:project_id => @project.id, :tasklist => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested tasklist" do
        tasklist = Tasklist.create! valid_attributes
        # Assuming there are no other tasklists in the database, this
        # specifies that the Tasklist created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Tasklist.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:project_id => @project.id, :id => tasklist.to_param, :tasklist => {'these' => 'params'}}
      end

      it "assigns the requested tasklist as @tasklist" do
        tasklist = Tasklist.create! valid_attributes
        put :update, {:project_id => @project.id, :id => tasklist.to_param, :tasklist => valid_attributes}
        assigns(:tasklist).should eq(tasklist)
      end

      it "redirects to the tasklist" do
        tasklist = Tasklist.create! valid_attributes
        put :update, {:project_id => @project.id, :id => tasklist.to_param, :tasklist => valid_attributes}
        response.should redirect_to(project_tasklist_path(@project,tasklist))
      end
    end

    describe "with invalid params" do
      it "assigns the tasklist as @tasklist" do
        tasklist = Tasklist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Tasklist.any_instance.stub(:save).and_return(false)
        put :update, {:project_id => @project.id, :id => tasklist.to_param, :tasklist => {}}
        assigns(:tasklist).should eq(tasklist)
      end

      it "re-renders the 'edit' template" do
        tasklist = Tasklist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Tasklist.any_instance.stub(:save).and_return(false)
        put :update, {:project_id => @project.id, :id => tasklist.to_param, :tasklist => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested tasklist" do
      tasklist = Tasklist.create! valid_attributes
      expect {
        delete :destroy, {:project_id => @project.id, :id => tasklist.to_param}
      }.to change(Tasklist, :count).by(-1)
    end

    it "redirects to the tasklists list" do
      tasklist = Tasklist.create! valid_attributes
      delete :destroy, {:project_id => @project.id, :id => tasklist.to_param}
      response.should redirect_to(project_tasklists_url)
    end
  end

end
