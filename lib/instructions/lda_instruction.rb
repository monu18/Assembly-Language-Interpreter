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
    address = memory.get_address(@symbol)
    registers.accumulator = memory.get_data(address)
    registers.update_zero_bit
  end
end

