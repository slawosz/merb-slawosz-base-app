require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/tester" do
  before(:each) do
    @response = request("/tester")
  end
end