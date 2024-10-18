# frozen_string_literal: true

class Memory
  attr_accessor :program, :data

  def initialize
    @program = Array.new(128, nil)  # Program memory
    @data = Array.new(128, 0)       # Data memory
  end

  def get_program_instruction(address)
    @program[address]
  end

  def get_data(address)
    @data[address]
  end

  def set_data(address, value)
    @data[address] = value
  end
end

