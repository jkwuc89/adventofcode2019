class DayTwo
  InvalidOpCodeError = Class.new(StandardError)

  ADD_OP_CODE = 1
  MULTIPLE_OP_CODE = 2
  END_PROGRAM_OP_CODE = 99

  def parse_program(program:)
    program.split(",").map(&:to_i)
  end

  def run_program(program:, is_running_puzzle_input: false)
    parsed_and_executed_program = parse_program(:program => program)

    if is_running_puzzle_input
      parsed_and_executed_program[1] = 12
      parsed_and_executed_program[2] = 2
    end

    op_code_position = 0
    loop do
      op_code = parsed_and_executed_program[op_code_position]
      break if op_code == END_PROGRAM_OP_CODE

      input_1_position = parsed_and_executed_program[op_code_position + 1]
      input_2_position = parsed_and_executed_program[op_code_position + 2]
      output_position = parsed_and_executed_program[op_code_position + 3]

      parsed_and_executed_program[output_position] = _execute_operation(
        :op_code => op_code,
        :input_1 => parsed_and_executed_program[input_1_position],
        :input_2 => parsed_and_executed_program[input_2_position]
      )

      op_code_position += 4
    end

    parsed_and_executed_program
  end

  private

  def _execute_operation(op_code:, input_1:, input_2:)
    case op_code
    when ADD_OP_CODE
      result = input_1 + input_2
    when MULTIPLE_OP_CODE
      result = input_1 * input_2
    else
      raise InvalidOpCodeError
    end

    result
  end
end

