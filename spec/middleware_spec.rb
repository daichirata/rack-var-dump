require File.dirname(__FILE__) + '/spec_helper'

describe 'VarDump' do
  include Rack::Test::Methods

  describe "insert responses" do
    let(:app) { Rack::VarDump.new(TestRackApp.new) }

    before { 'sample-text'.var_dump('Rspec:String') }
    insert_html = %Q[var_dump:0 Rspec:String\n&quot;sample-text&quot;]

    it "It is inserted when a status code is 200." do
      get '/'
      last_response.body.should include(insert_html)
    end

    it "It is not inserted when a contents type is not text/html. " do
      get '/image.jpg'
      last_response.body.should_not include(insert_html)
    end
  end
end
