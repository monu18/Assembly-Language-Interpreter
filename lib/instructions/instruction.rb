# frozen_string_literal: true

class Instruction
  attr_accessor :opcode

  def initialize(opcode)
    @opcode = opcode
  end

  def execute(memory, registers)
    raise NotImplementedError, "This method should be overridden in a subclass"
  end
end

