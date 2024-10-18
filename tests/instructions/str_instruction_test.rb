# frozen_string_literal: true

# tests/test_str_instruction.rb
require_relative '../../lib/memory'
require_relative '../../lib/register'
require_relative '../../lib/instructions/instructions_loader'

def test_str_instruction
  memory = Memory.new
  registers = Register.new
  instructions_loader = InstructionsLoader.new(memory, registers)

  # Pre-set the accumulator
  registers.accumulator = 77

  # Load the test SAL program
  memory.program[0] = "STR 131"  # Store accumulator value into memory address 131
  memory.program[1] = "HLT"      # Halt execution

  # Run the first instruction (STR)
  instructions_loader.execute_next

  # Check the memory value at address 131
  if memory.get_data(131) == 77
    puts "Test passed: STR stored the correct value into memory."
  else
    puts "Test failed: STR stored #{memory.get_data(131)}, expected 77."
  end
end

# Run the test
test_str_instruction
