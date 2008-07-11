class AutoBracketize
  extend Bracketize
  
  def previously_defined_instance_method
    'previously_defined_instance_method'
  end
  
  auto_bracketize!
  
  def later_defined_instance_method
    'later_defined_instance_method'
  end
end