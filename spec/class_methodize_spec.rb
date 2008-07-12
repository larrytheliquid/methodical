require File.join(File.dirname(__FILE__), 'spec_helper')
require File.join(File.dirname(__FILE__), 'fixtures', 'class_with_class_methods')

describe Methodical, "#class_methodize" do
  before(:each) do
    @class = ClassMethods
  end
  
  describe "with no parameters" do    
    it "should return a method object" do
      @class.method_with_no_parameters.should be_kind_of(Method)
    end

    it "should evaluate with brackets" do
      @class.method_with_no_parameters[].should == 23
    end
    
    it "should work with 'new' method" do
      @class.class_methodize(:new)
      @class.new[].should be_kind_of(ClassMethods)
    end
    
    describe "with a block parameter" do
      it "should return a method object" do
        @class.method_with_block_parameter.should be_kind_of(Method)
      end

      it "should evaluate with brackets" do
        @class.method_with_block_parameter.[] {|x| x + 3 }.should == 7
      end
    end    
  end
  
  describe "with a single parameter" do            
    it "should return a method object" do
      @class.method_with_single_parameter.should be_kind_of(Method)
    end

    it "should evaluate with brackets" do
      @class.method_with_single_parameter[4].should == 5
    end
  end
  
  describe "with multiple parameters" do
    it "should return a method object" do
      @class.method_with_multiple_parameters.should be_kind_of(Method)
    end

    it "should evaluate with brackets" do
      @class.method_with_multiple_parameters[4, 7].should == 11
    end

    describe "with an instance variable" do
      before(:each) do
        @class = ClassMethods
      end

      it "should return a method object" do
        @class.method_with_instance_variable.should be_kind_of(Method)
      end

      it "should evaluate with brackets" do
        @class.method_with_instance_variable[].should == 1337
      end
    end

    describe "with a class variable" do      
      it "should return a method object" do
        @class.method_with_class_variable.should be_kind_of(Method)
      end

      it "should evaluate with brackets" do
        @class.method_with_class_variable[].should == 7331
      end
    end
  end
end