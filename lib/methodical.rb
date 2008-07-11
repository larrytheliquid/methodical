module Methodical
  def methodize(*method_names)
    for method_name in method_names
      class_eval %{
        alias #{method_name}_without_methodize #{method_name}
        def #{method_name}
          method('#{method_name}_without_methodize')
        end
      }
    end
  end
  
  def class_methodize(*method_names)
    (class << self; self; end).methodize(*method_names)
  rescue NoMethodError    
    class << self; self.extend(Methodical); end
    retry
  end
  
  def auto_methodize!
    def method_added(method_name)
      unless @adding
        @adding = true
        methodize(method_name)
        @adding = false
      end
    end
  end
  
  def auto_class_methodize!
    def singleton_method_added(method_name)
      unless @adding
        @adding = true
        class_methodize(method_name)
        @adding = false
      end
    end
  end
end
