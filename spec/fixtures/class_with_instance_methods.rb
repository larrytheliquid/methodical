class InstanceMethods < Array
  @@class_variable = 7300 
  
  def initialize(instance_variable = 0)
    @instance_variable = instance_variable
  end
  
  def method_with_no_parameters
    23
  end
  
  def method_with_single_parameter(a)
    a + 1
  end
  
  def method_with_multiple_parameters(a, b)
    a + b
  end
  
  def method_with_instance_variable
    7 + @instance_variable
  end
  
  def method_with_class_variable
    31 + @@class_variable
  end
  
  include Methodical  
  methodize(:map)  
  methodize(:method_with_no_parameters)
  methodize(:method_with_single_parameter)  
  methodize(:method_with_multiple_parameters, :method_with_instance_variable, :method_with_class_variable)  
end