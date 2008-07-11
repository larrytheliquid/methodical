require File.join(File.dirname(__FILE__), 'spec_helper')
require File.join(File.dirname(__FILE__), 'fixtures', 'class_with_auto_bracketize')

describe Bracketize, "#auto_class_bracketize!" do
  before(:each) do
    @class = AutoBracketize
  end
  
  describe "with previously defined class methods" do
    it "should not class_bracketize them" do
      @class.previously_defined_class_method.should == 'previously_defined_class_method'        
    end
  end
  
  describe "with later defined class methods" do    
    it "should clss_bracketize them" do
      @class.later_defined_class_method[].should == 'later_defined_class_method'        
    end
  end
end