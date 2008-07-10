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

describe Bracketize, "#bracketize" do
  class Klass
    extend Bracketize
    
    def method_with_multiple_parameters(a, b)
      a + b
    end
    bracketize(:method_with_multiple_parameters)    
    
    def method_with_one_parameter(a)
      a + 1
    end
    bracketize(:method_with_one_parameter)
  end
  
  before(:each) do
    @klass = Klass.new
  end
  
  describe "for instance methods" do
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
  end
end
