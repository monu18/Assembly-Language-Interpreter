# frozen_string_literal: true
#
require_relative '../../lib/memory'
require_relative '../../lib/register'
require_relative '../../lib/instructions/instructions_loader'

def test_dec_instruction
  memory = Memory.new
  registers = Register.new
  instructions_loader = InstructionsLoader.new(memory, registers)

  # Declare a new symbol
  memory.program[0] = "DEC sum"  # Declare symbol "sum"
  memory.program[1] = "HLT"      # Halt execution

  # Run the DEC instruction
  instructions_loader.execute_next

  # Check that "sum" is stored in symbol_table and has a data memory address
  if memory.symbol_table["sum"] == 128
    puts "Test passed: 'sum' symbol allocated at address 128."
  else
    puts "Test failed: 'sum' symbol address is #{memory.symbol_table['sum']}, expected 128."
  end
end

# Run the test
test_dec_instruction


