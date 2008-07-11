require File.join(File.dirname(__FILE__), 'spec_helper')
require File.join(File.dirname(__FILE__), 'fixtures', 'klass')

describe Bracketize, "#bracketize" do    
  before(:each) do
    @klass = Klass.new
  end
  
  describe "for instance methods" do        
    describe "with no parameters" do            
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_no_parameters = @klass.method_with_no_parameters
        method_with_no_parameters[].should == 23
      end

      it "should evaluate with brackets" do
        @klass.method_with_no_parameters[].should == 23
      end
    end
    
    describe "with one parameter" do            
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_one_parameter = @klass.method_with_one_parameter
        method_with_one_parameter[4].should == 5
      end

      it "should evaluate with brackets" do
        @klass.method_with_one_parameter[4].should == 5
      end
    end
    
    describe "with multiple parameters" do
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_multiple_parameters = @klass.method_with_multiple_parameters
        method_with_multiple_parameters[4, 7].should == 11
      end

      it "should evaluate with brackets" do
        @klass.method_with_multiple_parameters[4, 7].should == 11
      end
    end
    
    describe "with an instance variable" do
      before(:each) do
        @klass = Klass.new(1330)
      end
      
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        pending
        method_with_instance_variable = @klass.method_with_instance_variable
        method_with_instance_variable[].should == 1337
      end

      it "should evaluate with brackets" do
        pending
        @klass.method_with_instance_variable[].should == 1337
      end
    end
    
    describe "with a class variable" do      
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        method_with_class_variable = @klass.method_with_class_variable
        method_with_class_variable[].should == 7331
      end

      it "should evaluate with brackets" do
        @klass.method_with_class_variable[].should == 7331
      end
    end
  end
end