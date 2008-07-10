# Ever wanted Ruby to have mandator parentheses for method calls...
# and have those method calls actually use brackets instead of
# parantheses? Probably not, but here's how to do it.
class Calculator
  def initialize(base)
    @base = base
  end
  
  # def self.new
  #   o = Object.new
  #   def o.[](base) initialize(base) end
  #   o
  # end
  
  def add
    o = Object.new
    def o.[](a, b) a + b end
    o
  end
  
  # make this use add
  def multiply
    o = Object.new
    def o.[](a, b) a * b end
    o
  end
  
  def add_then_multiply
    
  end
  
private
  
  def new_object
    
  end

end

calc = Calculator.new(10)
puts calc.add[3, 4] # => 7
puts calc.multiply[3, 4] # => 12