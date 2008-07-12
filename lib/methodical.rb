module Methodical  
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def methodize(*method_names)
      @_methodical_adding_methods = true
      for method_name in method_names
        class_eval %{
          alias_method '_methodical_#{method_name}', '#{method_name}'
          def #{method_name}
            method('_methodical_#{method_name}')
          end
        }
      end
      @_methodical_adding_methods = false  
    end

    def class_methodize(*method_names)
      @_methodical_adding_methods = true      
      (class << self; self; end).methodize(*method_names)
      @_methodical_adding_methods = false      
    rescue NoMethodError    
      class << self; self.extend(Methodical::ClassMethods); end
      retry
    end
    
    def method_added(method_name)
      methodize(method_name) unless @_methodical_adding_methods
    end

    def singleton_method_added(method_name)
      class_methodize(method_name) unless @_methodical_adding_methods
    end
  end
end
