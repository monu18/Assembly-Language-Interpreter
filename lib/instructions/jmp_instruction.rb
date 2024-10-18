# frozen_string_literal: true

require_relative 'instruction'

class JMPInstruction < Instruction
  def initialize(address)
    super("JMP")
    @address = address.to_i
  end

  def execute(memory, registers)
    registers.program_counter = @address - 1  # -1 to account for the PC increment in the command loop
  end
end

