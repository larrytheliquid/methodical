require File.join(File.dirname(__FILE__), 'spec_helper')
require File.join(File.dirname(__FILE__), 'fixtures', 'class_with_instance_methods')

describe Methodical, "#methodize" do
  before(:each) do
    @instance = InstanceMethods.new
  end
  
  describe "with a single parameter" do
    describe "with no parameters" do            
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_no_parameters = @instance.method_with_no_parameters
        method_with_no_parameters[].should == 23
      end

      it "should evaluate with brackets" do
        @instance.method_with_no_parameters[].should == 23
      end
    end
    
    it "for predicate methods"
    
    it "for bang methods"

    describe "with one parameter" do            
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_one_parameter = @instance.method_with_one_parameter
        method_with_one_parameter[4].should == 5
      end

      it "should evaluate with brackets" do
        @instance.method_with_one_parameter[4].should == 5
      end
    end
    
    describe "with a block parameter" do
      before(:each) do
        @instance << 5
      end
      
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_block_parameter = @instance.map
        method_with_block_parameter.[] {|x| x.to_s }.should == ["5"]
      end

      it "should evaluate with brackets" do
        @instance.map.[] {|x| x.to_s }.should == ["5"]
      end
    end
  end
  
  describe "with multiple parameters" do
    describe "with multiple parameters" do
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_multiple_parameters = @instance.method_with_multiple_parameters
        method_with_multiple_parameters[4, 7].should == 11
      end

      it "should evaluate with brackets" do
        @instance.method_with_multiple_parameters[4, 7].should == 11
      end
    end

    describe "with an instance variable" do
      before(:each) do
        @instance = InstanceMethods.new(1330)
      end

      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_instance_variable = @instance.method_with_instance_variable
        method_with_instance_variable[].should == 1337
      end

      it "should evaluate with brackets" do
        @instance.method_with_instance_variable[].should == 1337
      end
    end

    describe "with a class variable" do      
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_class_variable = @instance.method_with_class_variable
        method_with_class_variable[].should == 7331
      end

      it "should evaluate with brackets" do
        @instance.method_with_class_variable[].should == 7331
      end
    end
  end
end