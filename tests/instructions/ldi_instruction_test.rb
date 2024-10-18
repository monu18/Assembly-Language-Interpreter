# frozen_string_literal: true

# tests/test_ldi_instruction.rb
require_relative '../../lib/memory'
require_relative '../../lib/register'
require_relative '../../lib/instructions/instructions_loader'

def test_ldi_instruction
  memory = Memory.new
  registers = Register.new
  instructions_loader = InstructionsLoader.new(memory, registers)

  # Load the test SAL program
  memory.program[0] = "LDI 99"  # Load the value 99 into accumulator
  memory.program[1] = "HLT"     # Halt execution

  # Run the first instruction (LDI)
  instructions_loader.execute_next

  # Check the accumulator value
  if registers.accumulator == 99
    puts "Test passed: LDI loaded the correct value into the accumulator."
  else
    puts "Test failed: LDI loaded #{registers.accumulator}, expected 99."
  end
end

# Run the test
test_ldi_instruction
