class DayTwo
  InvalidOpCodeError = Class.new(StandardError)

  ADD_OP_CODE = 1
  MULTIPLE_OP_CODE = 2
  END_PROGRAM_OP_CODE = 99

  def run_program(program:, noun: nil, verb: nil)
    parsed_and_executed_program = program.split(",").map(&:to_i)

    parsed_and_executed_program[1] = noun if noun
    parsed_and_executed_program[2] = verb if verb

    op_code_position = 0
    loop do
      op_code = parsed_and_executed_program[op_code_position]
      break if op_code == END_PROGRAM_OP_CODE

      parameter_1_position = parsed_and_executed_program[op_code_position + 1]
      parameter_2_position = parsed_and_executed_program[op_code_position + 2]
      output_position = parsed_and_executed_program[op_code_position + 3]

      parsed_and_executed_program[output_position] = _execute_instruction(
        :op_code => op_code,
        :parameter_1 => parsed_and_executed_program[parameter_1_position],
        :parameter_2 => parsed_and_executed_program[parameter_2_position]
      )

      op_code_position += 4
    end

    parsed_and_executed_program
  end

  private

  def _execute_instruction(op_code:, parameter_1:, parameter_2:)
    case op_code
    when ADD_OP_CODE
      result = parameter_1 + parameter_2
    when MULTIPLE_OP_CODE
      result = parameter_1 * parameter_2
    else
      raise InvalidOpCodeError
    end

    result
  end
end

