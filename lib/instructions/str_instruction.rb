# frozen_string_literal: true

require_relative 'instruction'

class STRInstruction < Instruction
  def initialize(symbol)
    super("STR")
    @symbol = symbol
  end

  def execute(memory, registers)
    memory.set_data(@symbol.to_i, registers.accumulator)
  end
end

