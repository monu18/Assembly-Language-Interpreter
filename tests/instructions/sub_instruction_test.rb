# frozen_string_literal: true

require_relative '../../lib/memory'
require_relative '../../lib/register'
require_relative '../../lib/instructions/instructions_loader'

def test_sub_instruction
  memory = Memory.new
  registers = Register.new
  instructions_loader = InstructionsLoader.new(memory, registers)

  # Set initial values
  registers.accumulator = 50
  registers.data_register = 20

  # Load the test SAL program
  memory.program[0] = "SUB"  # Subtract B from A
  memory.program[1] = "HLT"  # Halt execution

  # Run the first instruction (SUB)
  instructions_loader.execute_next

  # Check the accumulator value
  if registers.accumulator == 30
    puts "Test passed: SUB subtracted the correct value."
  else
    puts "Test failed: SUB result was #{registers.accumulator}, expected 30."
  end
end

# Run the test
test_sub_instruction
