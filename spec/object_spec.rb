require File.dirname(__FILE__) + '/spec_helper'

describe 'Object' do
  it "instance should resond to var_dump" do
    Object.new.should respond_to('var_dump')
  end

  it "class should resond to var_dump" do
    Object.should respond_to('var_dump')
  end
end
