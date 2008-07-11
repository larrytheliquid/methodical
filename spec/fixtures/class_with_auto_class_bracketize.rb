class AutoBracketize
  extend Bracketize
  
  def self.previously_defined_class_method
    'previously_defined_class_method'
  end
  
  auto_class_bracketize!
  
  def self.later_defined_class_method
    'later_defined_class_method'
  end
end