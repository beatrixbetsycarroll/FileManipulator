require 'spec_helper'

require 'rspec'
require 'rack/test'

RSpec.describe 'my_file', :type => :controller do
  let(:file_one) {create(:my_file)}
  let(:file_two) {create(:my_file)}


  include Rack::Test::Methods

  def app
    puts Sinatra::Application.environment
    Sinatra::Application

  end

  describe "GET#new" do
    it "renders the :new form" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST#create" do
    it "creates a new MyFile and saves it in the database" do
      expect { post :create}.to change(MyFile, :count).by(1)
    end

    it "does not create a new MyFile and save it in the database if the filename is already taken" do
      expect { post :create}.to change(MyFile, :count).by(0)
    end
  end

  describe "GET#show" do
    it "assigns the correct file to @my_file" do
      get :show, id: file_one
      expect(assigns(:my_file)).to eq file_one
    end

    it "renders the :show template" do
      get :show, id: file_one
      expect(response).to render_template :show
    end
  end

  describe "/my_file/:id/.json" do
  	it "assigns the correct file to @my_file" do
      get :json, id: file_one
      expect(assigns(:my_file)).to eq file_one
    end

    it "returns json object for @my_file" do
      get :json, :id file_one
      expect(response).to eq file_one.to_json
    end
  end

end