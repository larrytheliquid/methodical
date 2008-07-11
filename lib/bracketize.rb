module Bracketize
  def bracketize(*method_names)
    method_names.each do |method_name|
      class_eval %{
        alias #{method_name}_without_bracketize #{method_name}
        def #{method_name}
          method('#{method_name}_without_bracketize')
        end
      }
    end
  end
  
  def class_bracketize(*method_names)
    (class << self; self; end).bracketize(*method_names)
  rescue NoMethodError    
    class << self; self.extend(Bracketize); end
    retry
  end
end
