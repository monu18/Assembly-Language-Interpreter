# frozen_string_literal: true

# tests/test_xch_instruction.rb
require_relative '../../lib/memory'
require_relative '../../lib/register'
require_relative '../../lib/instructions/instructions_loader'

def test_xch_instruction
  memory = Memory.new
  registers = Register.new
  instructions_loader = InstructionsLoader.new(memory, registers)

  # Set initial register values
  registers.accumulator = 20
  registers.b_register = 30

  # Load the test SAL program
  memory.program[0] = "XCH"  # Exchange accumulator and B register
  memory.program[1] = "HLT"  # Halt execution

  # Run the first instruction (XCH)
  instructions_loader.execute_next

  # Check the swapped values
  if registers.accumulator == 30 && registers.b_register == 20
    puts "Test passed: XCH exchanged the register values correctly."
  else
    puts "Test failed: XCH result accumulator=#{registers.accumulator}, B=#{registers.b_register}."
  end
end

# Run the test
test_xch_instruction
