# frozen_string_literal: true

class Register
  attr_accessor :accumulator, :b_register, :program_counter, :zero_bit

  def initialize
    @accumulator = 0
    @b_register = 0
    @program_counter = 0
    @zero_bit = 0
  end

  def update_zero_bit
    @zero_bit = (@accumulator == 0) ? 1 : 0
  end
end

