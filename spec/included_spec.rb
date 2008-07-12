require File.join(File.dirname(__FILE__), 'spec_helper')
require File.join(File.dirname(__FILE__), 'fixtures', 'class_with_include_in_middle')

describe Methodical, ".included" do
  before(:each) do
    @instance = ClassWithIncludeInMiddle.new
  end
  
  describe "for instance methods" do
    describe "that were previously defined" do
      it "should not methodize them" do
        @instance.previously_defined_instance_method.should == 'previously_defined_instance_method'        
      end
    end

    describe "that were defined later" do    
      it "should methodize them" do
        @instance.later_defined_instance_method[].should == 'later_defined_instance_method'        
      end
    end
    
    it "should work with 'initialize' defined later" do
      @instance.instance_variable_defined?(:@initialize_called).should be_true
    end
  end
  
  describe "for class methods" do
    describe "that were previously defined" do
      it "should not class_methodize them" do
        @instance.class.previously_defined_class_method.should == 'previously_defined_class_method'        
      end
    end

    describe "that were defined later" do    
      it "should class_methodize them" do
        @instance.class.later_defined_class_method[].should == 'later_defined_class_method'        
      end
    end
  end
end