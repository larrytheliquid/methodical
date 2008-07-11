require File.join(File.dirname(__FILE__), 'spec_helper')
require File.join(File.dirname(__FILE__), 'fixtures', 'class_with_auto_bracketize')

describe Bracketize, "#auto_bracketize!" do
  before(:each) do
    @instance = AutoBracketize.new
  end
  
  describe "with previously defined instance methods" do
    it "should not bracketize them" do
      @instance.previously_defined_instance_method.should == 'previously_defined_instance_method'        
    end
  end
  
  describe "with later defined instance methods" do    
    it "should bracketize them" do
      @instance.later_defined_instance_method[].should == 'later_defined_instance_method'        
    end
  end
end