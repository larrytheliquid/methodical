require File.join(File.dirname(__FILE__), 'spec_helper')
require File.join(File.dirname(__FILE__), 'fixtures', 'class_with_class_methods')

describe Methodical, "#class_methodize" do
  before(:each) do
    @class = ClassMethods
  end
  
  describe "with a single parameter" do
    describe "with no parameters" do            
      it "should work with 'new' method"
      
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_no_parameters = @class.method_with_no_parameters
        method_with_no_parameters[].should == 23
      end

      it "should evaluate with brackets" do
        @class.method_with_no_parameters[].should == 23
      end
    end

    describe "with one parameter" do            
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_one_parameter = @class.method_with_one_parameter
        method_with_one_parameter[4].should == 5
      end

      it "should evaluate with brackets" do
        @class.method_with_one_parameter[4].should == 5
      end
    end
    
    describe "with a block parameter" do
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_block_parameter = @class.method_with_block_parameter
        method_with_block_parameter.[] {|x| x + 3 }.should == 7
      end

      it "should evaluate with brackets" do
        @class.method_with_block_parameter.[] {|x| x + 3 }.should == 7
      end
    end
  end
  
  describe "with multiple parameters" do
    describe "with multiple parameters" do
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_multiple_parameters = @class.method_with_multiple_parameters
        method_with_multiple_parameters[4, 7].should == 11
      end

      it "should evaluate with brackets" do
        @class.method_with_multiple_parameters[4, 7].should == 11
      end
    end

    describe "with an instance variable" do
      before(:each) do
        @class = ClassMethods
      end

      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_instance_variable = @class.method_with_instance_variable
        method_with_instance_variable[].should == 1337
      end

      it "should evaluate with brackets" do
        @class.method_with_instance_variable[].should == 1337
      end
    end

    describe "with a class variable" do      
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_class_variable = @class.method_with_class_variable
        method_with_class_variable[].should == 7331
      end

      it "should evaluate with brackets" do
        @class.method_with_class_variable[].should == 7331
      end
    end
  end
end