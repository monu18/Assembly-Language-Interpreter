# frozen_string_literal: true

require_relative 'instruction'

class STRInstruction < Instruction
  def initialize(symbol)
    super("STR")
    @symbol = symbol
  end

  def execute(memory, registers)
    address = memory.get_address(@symbol)
    memory.set_data(address, registers.accumulator)
  end
end

