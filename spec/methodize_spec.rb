require File.join(File.dirname(__FILE__), 'spec_helper')
require File.join(File.dirname(__FILE__), 'fixtures', 'class_with_instance_methods')

describe Methodical, "#methodize, for instance methods" do
  before(:each) do
    @instance = InstanceMethods.new
  end
  
  describe "with no parameters" do            
    it "should return a method object" do
      @instance.method_with_no_parameters.should be_kind_of(Method)
    end

    it "should evaluate with brackets" do
      @instance.method_with_no_parameters[].should == 23
    end
    
    describe "with a block parameter" do
      before(:each) do
        @instance << 5
      end
      
      it "should return a method object" do
        @instance.map.should be_kind_of(Method)
      end

      it "should evaluate with brackets" do
        @instance.map.[] {|x| x.to_s }.should == ["5"]
      end
    end
    
    describe "that end in ?" do
      it "should return a method object" do
        @instance.predicate_method?.should be_kind_of(Method)
      end

      it "should evaluate with brackets" do
        @instance.predicate_method?[].should == true
      end
    end

    describe "that end in !" do
      it "should return a method object" do
        @instance.bang_method!.should be_kind_of(Method)
      end

      it "should evaluate with brackets" do
        @instance.bang_method![].should == "pow!"
      end
    end
    
    describe "that have optional spaces like ==" do
      it "should return a method object" do
        @instance.==().should be_kind_of(Method)
      end
    
      it "should evaluate with brackets" do
        @instance.==()['something_else'].should == false
      end
    end
  end
  
  describe "with a single parameter" do
    it "should return a method object" do
      @instance.method_with_single_parameter.should be_kind_of(Method)
    end

    it "should evaluate with brackets" do
      @instance.method_with_single_parameter[4].should == 5
    end
  end
  
  describe "with multiple parameters" do
    it "should return a method object" do
      @instance.method_with_multiple_parameters.should be_kind_of(Method)
    end

    it "should evaluate with brackets" do
      @instance.method_with_multiple_parameters[4, 7].should == 11
    end

    describe "with an instance variable" do
      before(:each) do
        @instance = InstanceMethods.new(1330)
      end

      it "should return a method object" do
        @instance.method_with_instance_variable.should be_kind_of(Method)
      end

      it "should evaluate with brackets" do
        @instance.method_with_instance_variable[].should == 1337
      end
    end

    describe "with a class variable" do      
      it "should return a method object" do
        @instance.method_with_class_variable.should be_kind_of(Method)
      end

      it "should evaluate with brackets" do
        @instance.method_with_class_variable[].should == 7331
      end
    end
  end
end