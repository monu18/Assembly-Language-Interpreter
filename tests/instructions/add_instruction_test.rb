# frozen_string_literal: true

require_relative '../../lib/memory'
require_relative '../../lib/register'
require_relative '../../lib/instructions/instructions_loader'

def test_add_instruction
  memory = Memory.new
  registers = Register.new
  instructions_loader = InstructionsLoader.new(memory, registers)

  # Pre-load memory with data for the test
  registers.accumulator = 10
  registers.data_register = 15

  # Load the test SAL program
  memory.program[0] = "ADD"  # Add B to A
  memory.program[1] = "HLT"  # Halt execution

  # Run the first instruction (ADD)
  instructions_loader.execute_next

  # Check the accumulator value
  if registers.accumulator == 25
    puts "Test passed: ADD added the correct value into the accumulator."
  else
    puts "Test failed: ADD result was #{registers.accumulator}, expected 25."
  end
end

# Run the test
test_add_instruction
