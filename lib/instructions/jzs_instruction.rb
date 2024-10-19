# frozen_string_literal: true

require_relative 'instruction'

class JZSInstruction < Instruction
  def initialize(address)
    super("JZS")
    @address = address.to_i
  end

  def execute(memory, registers)
    if registers.zero_bit == 1
      registers.program_counter = @address
    end
  end
end

