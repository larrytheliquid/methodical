require File.join(File.dirname(__FILE__), 'spec_helper')
require File.join(File.dirname(__FILE__), 'fixtures', 'class_with_auto_methodize')

describe Methodical, "#auto_methodize!" do
  before(:each) do
    @instance = AutoMethodical.new
  end
  
  describe "with previously defined instance methods" do
    it "should not methodize them" do
      @instance.previously_defined_instance_method.should == 'previously_defined_instance_method'        
    end
  end
  
  describe "with later defined instance methods" do    
    it "should methodize them" do
      @instance.later_defined_instance_method[].should == 'later_defined_instance_method'        
    end
  end
end