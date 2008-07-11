module Bracketize
  def bracketize(method_name)      
    method = instance_method(method_name).bind(self.new)
    define_method(method_name) do       
      o = Object.new
      (class << o; self; end).send(:define_method, :[]) do |*arguments|
        method.call(*arguments)
      end
      o
    end
  end
end

class Klass
  extend Bracketize  
  @@class_variable = 7300 
  
  def initialize(instance_variable = 0)
    @instance_variable = instance_variable
  end
  
  def method_with_no_parameters
    23
  end
  bracketize(:method_with_no_parameters)
  
  def method_with_one_parameter(a)
    a + 1
  end
  bracketize(:method_with_one_parameter)
  
  def method_with_multiple_parameters(a, b)
    a + b
  end
  bracketize(:method_with_multiple_parameters)
  
  def method_with_instance_variable
    7 + @instance_variable
  end
  bracketize(:method_with_instance_variable)
  
  def method_with_class_variable
    31 + @@class_variable
  end
  bracketize(:method_with_class_variable)
end

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
