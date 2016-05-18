require_relative "Sum"
require_relative "Difference"
require_relative "Multiplication"
require_relative "Division"
require_relative "Inverse"
require_relative "Square"
require_relative "SquareRoot"

class Calculator

	def add_operand(operand)
       @operand_temp = operand 


       if @current_operation.nil? @operand_temp = op 
       else @current_operation = add_operand(op)    
	end	 

	def set_operation(operation)
	operation_klass = 
	case operation
	
         when "+" then Sum
         when "-" then Difference
         when "*" then Multiplication
         when "/" then Division
         when "INV" then Inverse
         when "SQ" then Square
         when "SQRT" then SquareRoot      				
		end

		@current_operation = operation_klass.new(@operand_temp)
		@operand_temp = nil				
	end

    def execute
    	result = @current_operation.execute
    	clear
    	result
    rescue ZeroDivisionError
    	"ERROR"
    end 
    
    def clear
    	@current_operation=nil
    	@operand_temp=nil
    end

end
         	
    
