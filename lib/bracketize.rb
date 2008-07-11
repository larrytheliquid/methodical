module Bracketize
  def bracketize(method_name)      
    method = instance_method(method_name).bind(self.new)
    define_method(method_name) do       
      o = Object.new
      (class << o; self; end).send(:define_method, :[]) do |*arguments|
        method.call(*arguments)
      end
      o
    end
  end
end
