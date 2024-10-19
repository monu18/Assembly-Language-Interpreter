# frozen_string_literal: true

# frozen_string_literal: true

require_relative '../../lib/register'
require_relative '../../lib/instructions/instructions_loader'
require_relative '../../lib/memory'

def test_jmp_instruction
  memory = Memory.new
  registers = Register.new
  instructions_loader = InstructionsLoader.new(memory, registers)

  # Load the test SAL program
  memory.program[0] = "JMP 3"  # Jump to address 3
  memory.program[1] = "LDI 99" # This instruction should be skipped
  memory.program[2] = "HLT"    # Halt execution at address 3

  # Execute JMP
  instructions_loader.execute_next

  # Check the program counter
  if registers.program_counter == 3  # Jumped to address 3
    puts "Test passed: JMP jumped to the correct address."
  else
    puts "Test failed: JMP did not jump as expected."
  end
end

# Run the test
test_jmp_instruction
