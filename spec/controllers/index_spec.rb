require 'spec_helper'

require 'rspec'
require 'rack/test'

RSpec.describe 'index', :type => :controller do

include Rack::Test::Methods

  def app
    puts Sinatra::Application.environment
    Sinatra::Application

  end

  describe '/' do
    it 'loads the home page' do
      get '/'
      expect(last_response).to be_ok
      expect(last_reponse.body).to contain("Upload File")
    end
  end

  describe '/search' do
  	it 'loads the search page' do
  	get '/'
      expect(last_response).to be_ok
      xpect(last_reponse.body).to contain("Submit")
  	end
  end

end