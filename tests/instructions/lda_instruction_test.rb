# frozen_string_literal: true

require_relative '../../lib/register'
require_relative '../../lib/instructions/instructions_loader'
require_relative '../memory_test'

def test_lda_instruction
  memory = Memory.new
  registers = Register.new
  instructions_loader = InstructionsLoader.new(memory, registers)

  # Pre-load memory with data for the test
  setup_memory_with_data(memory)

  # Load the test SAL program
  memory.program[0] = "LDA 130"  # Load value from memory address 130
  memory.program[1] = "HLT"      # Halt execution

  # Run the first instruction (LDA)
  instructions_loader.execute_next

  # Check the accumulator value
  if registers.accumulator == 42
    puts "Test passed: LDA loaded the correct value into the accumulator."
  else
    puts "Test failed: LDA loaded #{registers.accumulator}, expected 42."
  end
end

# Run the test
test_lda_instruction
