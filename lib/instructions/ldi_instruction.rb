# frozen_string_literal: true

require_relative 'instruction'

class LDIInstruction < Instruction
  def initialize(value)
    super("LDI")
    @value = value.to_i
  end

  def execute(memory, registers)
    registers.accumulator = @value
    registers.update_zero_bit
  end
end

