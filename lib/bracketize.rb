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
end
