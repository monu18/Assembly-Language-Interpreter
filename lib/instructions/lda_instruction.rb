# frozen_string_literal: true

require_relative 'instruction'
require_relative '../memory'
require_relative '../register'

class LDAInstruction < Instruction
  def initialize(symbol)
    super("LDA")
    @symbol = symbol
  end

  def execute(memory, registers)
    registers.accumulator = memory.get_data(@symbol.to_i)  # Assuming the symbol is a memory address for now
    registers.update_zero_bit
  end
end

