require File.join(File.dirname(__FILE__), 'spec_helper')
require File.join(File.dirname(__FILE__), 'fixtures', 'class_with_auto_class_methodize')

describe Methodical, "#auto_class_methodize!" do
  before(:each) do
    @class = AutoMethodical
  end
  
  describe "with previously defined class methods" do
    it "should not class_methodize them" do
      @class.previously_defined_class_method.should == 'previously_defined_class_method'        
    end
  end
  
  describe "with later defined class methods" do    
    it "should clss_methodize them" do
      @class.later_defined_class_method[].should == 'later_defined_class_method'        
    end
  end
end