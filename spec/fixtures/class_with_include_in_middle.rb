class ClassWithIncludeInMiddle        
  def self.previously_defined_class_method
    'previously_defined_class_method'
  end
  
  def previously_defined_instance_method
    'previously_defined_instance_method'
  end
  
  include Methodical
  
  def self.later_defined_class_method
    'later_defined_class_method'
  end
  
  def later_defined_instance_method
    'later_defined_instance_method'
  end
end