# frozen_string_literal: true

require_relative '../lib/memory'
require_relative '../lib/register'
require_relative '../lib/instructions/instructions_loader'

def setup_memory_with_data(memory)
  # Set a specific value in the memory for testing
  memory.set_data(130, 42)  # Pre-load value 42 into memory address 130
end

# Run memory setup test
def test_memory_setup
  memory = Memory.new
  setup_memory_with_data(memory)

  if memory.get_data(130) == 42
    puts "Test passed: Memory at address 130 contains the correct value."
  else
    puts "Test failed: Memory at address 130 contains #{memory.get_data(130)}, expected 42."
  end
end

# Run the test
test_memory_setup
