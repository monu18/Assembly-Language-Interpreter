# frozen_string_literal: true

require_relative 'instruction'

class XCHInstruction < Instruction
  def initialize
    super("XCH")
  end

  def execute(memory, registers)
    registers.accumulator, registers.b_register = registers.b_register, registers.accumulator
  end
end

