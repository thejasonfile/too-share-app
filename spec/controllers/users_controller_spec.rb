require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end # it

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end # it
  end #describe

  describe "POST #create" do
    it "creates a user" do
      expect { post :create, user: FactoryGirl.attributes_for(:user) }.to change(User, :count).by(1)
    end #it

    # it "the session id is set to match the user id" do
    #   expect {post :create, user: FactoryGirl.attributes_for(:user) }.to 
    # end #it

    # it "redirects to user_path if successfully saved" do

    # end #it

    it "renders the new template if not saved" do
    get :new
    expect(response). to render_template("new")
    end #it
  end #describe

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end # it

    it "renders the new template" do
      get :show
      expect(response).to render_template("show")
    end # it
  end #describe

end #rspec