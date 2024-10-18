# frozen_string_literal: true

require_relative 'instruction'

class SUBInstruction < Instruction
  def initialize
    super("SUB")
  end

  def execute(memory, registers)
    result = registers.accumulator - registers.b_register
    if result.between?(-32_768, 32_767)  # 16-bit range
      registers.accumulator = result
    end
    registers.update_zero_bit
  end
end

