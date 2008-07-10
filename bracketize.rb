module Bracketize
end

describe Bracketize, "#bracketize" do
  class Klass
    def self.bracketize(method_name)      
      class_eval do
        method = instance_method(:method_with_parameters)        
        def method_with_parameters
          o = Object.new
          (class << o; self; end).send(:define_method, :[]) do |a, b|
            a + b
          end
          o
        end
      end
    end
    
    def method_with_parameters(a, b)
      a + b
    end
    
    bracketize(:method_with_parameters)
  end
  
  before(:each) do
    @klass = Klass.new
  end
  
  describe "for instance methods" do
    describe "with multiple parameters" do
      it "should return a 'pointer' object without brackets that can be evaluated with brackets" do
        @klass.method_with_parameters[4, 7].should == 11
      end

      it "should evaluate with brackets" do
        method_with_parameters = @klass.method_with_parameters
        method_with_parameters[4, 7].should == 11
      end
    end
  end
end

# class Calculator
#   attr_reader :base
#   
#   def self.new
#     o = method_holder
#     instance_of_self = super 
#     (class << o; self; end).send(:define_method, :[]) do |base|
#       instance_of_self.instance_variable_set(:@base, base)
#       instance_of_self
#     end
#     o
#   end
#   
#   def add
#     o = self.class.method_holder
#     def o.[](a, b) a + b end
#     o
#   end
#   
#   # make this use add
#   def multiply
#     o = self.class.method_holder
#     def o.[](a, b) a * b end
#     o
#   end
#   
# private
#   
#   def self.method_holder
#     Object.new
#   end
# end
# 
# describe Calculator do
#   before(:each) do
#     @calculator = Calculator.new[10]
#   end
#   
#   describe Calculator, "#new" do        
#     describe "called with brackets" do
#       it "should set base" do
#         Calculator.new[10].base.should == 10
#       end
#     end
# 
#     describe "called without brackets" do
#       it "should return a reference to the method that can be called with brackets" do        
#         new = Calculator.new
#         new[10].base.should == 10
#       end
#     end
#   end
# 
#   describe Calculator, "#add" do  
#     describe "called with brackets" do
#       it "should return the sum of the values" do
#         @calculator.add[4, 7].should == 11
#       end
#     end
# 
#     describe "called without brackets" do
#       it "should return a reference to the method that can be called with brackets" do
#         add = @calculator.add
#         add[4, 7].should == 11
#       end
#     end
#   end
# 
#   describe Calculator, "#multiply" do
#     describe "called with brackets" do
#       it "should return the product of the values" do
#         @calculator.multiply[4, 7].should == 28
#       end
# 
#       describe "called without brackets" do
#         it "should return a reference to the method that can be called with brackets" do
#           multiply = @calculator.multiply
#           multiply[4, 7].should == 28
#         end
#       end
#     end
#   end
# end
