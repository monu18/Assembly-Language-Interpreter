# frozen_string_literal: true

class Register
  attr_accessor :accumulator, :data_register, :program_counter, :zero_bit

  def initialize
    @accumulator = 0
    @data_register = 0
    @program_counter = 0
    @zero_bit = 0
  end

  def update_zero_bit
    new_zero_bit = (@accumulator == 0) ? 1 : 0
    # Only print if the zero bit is changing
    if new_zero_bit != @zero_bit
      # puts "Zero Bit Changing: Zero Bit from #{@zero_bit} to #{new_zero_bit}"
      @zero_bit = new_zero_bit
    end
  end
end

