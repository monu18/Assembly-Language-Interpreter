# frozen_string_literal: true

require_relative 'instruction'

class HLTInstruction < Instruction
  def initialize
    super("HLT")
  end

  def execute(memory, registers)
    puts "Program halted."
  end
end
