# frozen_string_literal: true

require_relative '../../lib/register'
require_relative '../../lib/instructions/instructions_loader'
require_relative '../memory_test'

def test_jzs_instruction
  memory = Memory.new
  registers = Register.new
  instructions_loader = InstructionsLoader.new(memory, registers)

  # Pre-set the zero bit and load the test program
  registers.zero_bit = 1
  memory.program[0] = "JZS 3"  # Jump to address 3 if zero bit is set
  memory.program[1] = "LDI 99" # This instruction should be skipped
  memory.program[2] = "HLT"    # Halt execution at address 3

  # Execute LZS
  instructions_loader.execute_next

  # Check the program counter
  if registers.program_counter == 3  # Jumped to address 3
    puts "Test passed: LZS jumped to the correct address."
  else
    puts "Test failed: LZS did not jump as expected."
  end
end

# Run the test
test_jzs_instruction
