module Bracketize
  def bracketize(*method_names)
    method_names.each do |method_name|
      class_eval do
        alias_method(:"#{method_name}_without_bracketize", method_name)
        define_method(method_name) do
          method(:"#{method_name}_without_bracketize")
        end
      end
    end
  end
end
