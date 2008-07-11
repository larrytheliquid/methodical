class ClassMethods
  @@class_variable = 7300 
  @instance_variable  = 1330
  
  def self.method_with_no_parameters
    23
  end
  
  def self.method_with_one_parameter(a)
    a + 1
  end
  
  def self.method_with_block_parameter
    yield(4) 
  end
  
  def self.method_with_multiple_parameters(a, b)
    a + b
  end
  
  def self.method_with_instance_variable
    7 + @instance_variable
  end
  
  def self.method_with_class_variable
    31 + @@class_variable
  end
  
  extend Methodical  
  class_methodize(:method_with_no_parameters)  
  class_methodize(:method_with_one_parameter)  
  class_methodize(:method_with_block_parameter)  
  class_methodize(:method_with_multiple_parameters, :method_with_instance_variable, :method_with_class_variable)
end