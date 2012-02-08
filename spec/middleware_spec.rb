require File.dirname(__FILE__) + '/spec_helper'

describe 'VarDump' do
  include Rack::Test::Methods

  let(:app) { Rack::VarDump.new(TestRackApp.new) }

  describe "when var_dump is performed" do
    before { 'sample-text'.var_dump }
    let(:insert_html) do
      %Q(var_dump:0 \n<kbd style=\"color:brown\">&quot;sample-text&quot;</kbd>)
    end

    it "it is inserted when a status code is 200." do
      get '/'
      last_response.body.should include(insert_html)
    end

    it "it is not inserted when a contents type is not text/html. " do
      get '/image.jpg'
      last_response.body.should_not include(insert_html)
    end
  end

  describe "when an argument is given" do
    before { 'sample-text'.var_dump('Rspec:String') }
    let(:insert_html) do
      %Q(var_dump:0 Rspec:String\n<kbd style=\"color:brown\">&quot;sample-text&quot;</kbd>)
    end

    it "It displays with subject." do
      get '/'
      last_response.body.should include(insert_html)
    end
  end

  describe "when the two or more sets value is carried out" do
    before{'sample-text'.var_dump; 'sample-text-2'.var_dump('Rspec:String2')}
    let(:insert_html) do
      %Q(var_dump:0 \n<kbd style=\"color:brown\">&quot;sample-text&quot;</kbd>\n\nvar_dump:1 Rspec:String2\n<kbd style=\"color:brown\">&quot;sample-text-2&quot;</kbd>)
    end

    it "more than one are outputted." do
      get '/'
      last_response.body.should include(insert_html)
    end
  end

  describe "not insert responses" do
    it "nothing is outputted when the value is not set to var_dump." do
      get '/'
      last_response.body.should eql(DummyBody)
    end
  end
end
