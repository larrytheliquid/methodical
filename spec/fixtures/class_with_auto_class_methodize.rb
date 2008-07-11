class AutoMethodical
  extend Methodical
  
  def self.previously_defined_class_method
    'previously_defined_class_method'
  end
  
  auto_class_methodize!
  
  def self.later_defined_class_method
    'later_defined_class_method'
  end
end