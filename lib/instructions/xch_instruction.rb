# frozen_string_literal: true

require_relative 'instruction'

class XCHInstruction < Instruction
  def initialize
    super("XCH")
  end

  def execute(memory, registers)
    registers.accumulator, registers.data_register = registers.data_register, registers.accumulator
  end
end

