# frozen_string_literal: true

require_relative 'instruction'
require_relative '../memory'
require_relative '../register'

class DECInstruction < Instruction

  def initialize(symbol)
    super("DEC")
    @symbol = symbol
  end

  def execute(memory, registers)
    memory.allocate_symbol(@symbol)
  end
end

