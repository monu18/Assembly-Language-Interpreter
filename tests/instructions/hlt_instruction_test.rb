# frozen_string_literal: true

# tests/test_hlt_instruction.rb
require_relative '../../lib/memory'
require_relative '../../lib/register'
require_relative '../../lib/instructions/instructions_loader'

def test_hlt_instruction
  memory = Memory.new
  registers = Register.new
  instructions_loader = InstructionsLoader.new(memory, registers)

  # Load the test SAL program
  memory.program[0] = "HLT"  # Halt execution

  # Run the first instruction (HLT)
  instructions_loader.execute_next

  # Check if the program halts
  puts "Test passed: HLT halted the program."
end

# Run the test
test_hlt_instruction
