class AutoMethodical
  extend Methodical
  
  def previously_defined_instance_method
    'previously_defined_instance_method'
  end
  
  auto_methodize!
  
  def later_defined_instance_method
    'later_defined_instance_method'
  end
end