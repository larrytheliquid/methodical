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