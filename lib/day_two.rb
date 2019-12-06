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

  def determine_noun_and_verb_for_output(program:, desired_output:)
    (0..99).each do |current_noun|
      (0..99).each do |current_verb|
        executed_program = run_program(:program => program, :noun => current_noun, :verb => current_verb)
        return {
          :noun => current_noun,
          :verb => current_verb
        } if executed_program[0] == desired_output
      end
    end

    {}
  end

  def get_calculated_noun_and_verb_for(program:, desired_output:)
    noun_and_verb = determine_noun_and_verb_for_output(:program => program, :desired_output => desired_output)
    return 0 if noun_and_verb == {}
    noun_and_verb[:noun] * 100 + noun_and_verb[:verb]
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

