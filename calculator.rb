require_relative "operations/Sum"
require_relative "operations/Difference"
require_relative "operations/Multiplication"
require_relative "operations/Division"
require_relative "operations/Inverse"
require_relative "operations/Square"
require_relative "operations/SquareRoot"

class Calculator

	def add_operand(operand)
       @operand_temp = operand 


       if @current_operation.nil? 
            @operand_temp = operand 
       else 
        @current_operation.add_operand(operand)  
       end  
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
         	
    
