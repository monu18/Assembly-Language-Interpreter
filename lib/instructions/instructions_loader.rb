# frozen_string_literal: true

require_relative 'lda_instruction'
require_relative 'ldi_instruction'
require_relative 'str_instruction'
require_relative 'xch_instruction'
require_relative 'add_instruction'
require_relative 'sub_instruction'
require_relative 'hlt_instruction'
require_relative 'jmp_instruction'
require_relative 'jzs_instruction'

class InstructionsLoader
  def initialize(memory, registers)
    @memory = memory
    @registers = registers
  end

  def execute_next
    instruction_line = @memory.get_program_instruction(@registers.program_counter)
    instruction = parse_instruction(instruction_line)
    return if instruction.nil?  # Skip if no valid instruction (e.g., comment or empty line)
    instruction.execute(@memory, @registers)
    print_state
    @registers.program_counter += 1
  end

  def execute_all
    while (instruction_line = @memory.get_program_instruction(@registers.program_counter))
      instruction = parse_instruction(instruction_line)
      break if instruction.nil?  # Skip comment/empty lines and move to the next one
      instruction.execute(@memory, @registers)
      print_state
      @registers.program_counter += 1
      break if instruction.opcode == "HLT"
    end
  end

  private
  def parse_instruction(line)

    return nil if line.nil? || line.strip.empty? || line.strip.start_with?('#')  # Ignore comments and empty lines

    cleaned_line = line.strip  # Remove leading and trailing spaces
    opcode, arg = cleaned_line.split(/\s+/, 2)  # Split by one or more spaces

    case opcode
    when "LDA"
      LDAInstruction.new(arg)
    when "LDI"
      LDIInstruction.new(arg)
    when "STR"
      STRInstruction.new(arg)
    when "XCH"
      XCHInstruction.new
    when "ADD"
      ADDInstruction.new
    when "SUB"
      SUBInstruction.new
    when "HLT"
      HLTInstruction.new
    when "JMP"
      JMPInstruction.new(arg)
    when "JZS"
      JZSInstruction.new(arg)
    else
      raise "Unknown instruction: #{opcode}"
    end
  end

  def print_state
    puts "PC: #{@registers.program_counter}, Acc: #{@registers.accumulator}, B: #{@registers.b_register}, Zero: #{@registers.zero_bit}"
    print_memory
  end

  def print_memory
    puts "Memory State: "
    (128..255).each do |index|
      value = @memory.get_data(index)
      puts "Memory[#{index}] = #{value}" unless value == 0 || value.nil?
    end
  end

end
