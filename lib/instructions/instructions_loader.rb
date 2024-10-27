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
require_relative 'dec_instruction'

class InstructionsLoader
  MAX_INSTRUCTION_LIMIT = 1000  # Maximum number of instructions before halting for user input
  @is_execute_all = false

  def initialize(memory, registers)
    @memory = memory
    @registers = registers
    @instruction_count = 0  # Counter for instructions executed
    @halted = false  # New flag to check if HLT is encountered

  end

  def halted?
    @halted
  end

  def execute_next
    current_pc = @registers.program_counter  # Store current PC

    if @instruction_count >= MAX_INSTRUCTION_LIMIT
      puts "Execution reached #{@instruction_count} instructions. Continue? (y/n)"
      response = gets.chomp.downcase
      if response == 'y'
        @instruction_count = 0  # Reset the counter if user chooses to continue
      else
        puts "Execution halted by user after #{@instruction_count} instructions."
        return
      end
    end

    instruction_line = @memory.get_program_instruction(current_pc)
    instruction = parse_instruction(instruction_line)
    return if instruction.nil?  # Skip if no valid instruction (e.g., comment or empty line)

    if instruction_line.strip.start_with?("HLT")
      @halted = true  # Set halted flag when HLT is encountered
      #return
    end

    instruction.execute(@memory, @registers)

    #exit if instruction_line.strip.start_with?("HLT")
    # Increment the PC unless it's a jump instruction (JMP or LZS)
    if @registers.program_counter == current_pc
      @registers.program_counter += 1
    end

    @instruction_count += 1  # Increment the instruction counter

    unless @is_execute_all
      print_state
      print_instruction(current_pc, instruction_line)
      print_data_memory
    end
  end

  def execute_all
    @is_execute_all = true
    while @memory.get_program_instruction(@registers.program_counter)
      execute_next
      break if @halted  # Exit the loop if halted
    end
    print_state
    print_program_memory
    print_data_memory
  end

  private
  def parse_instruction(line)

    return nil if line.nil? || line.strip.empty? || line.strip.start_with?('#')  # Ignore comments and empty lines

    cleaned_line = line.strip  # Remove leading and trailing spaces
    opcode, arg = cleaned_line.split(/\s+/, 2)  # Split by one or more spaces

    case opcode
    when "DEC"
      DECInstruction.new(arg)
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

  def print_instruction(pc, instruction_line)
    puts "Memory[#{pc}] = #{instruction_line}" unless instruction_line == 0 || instruction_line.nil?
  end

  def print_state
    puts "PC: #{@registers.program_counter}, Register A: #{@registers.accumulator}, Register B: #{@registers.data_register}, Zero Bit: #{@registers.zero_bit}"
  end

  def print_program_memory
    puts "Program Memory State: "
    (0..127).each do |index|
      value = @memory.get_program_instruction(index)
      puts "Memory[#{index}] = #{value}" unless value == 0 || value.nil?
    end
  end

  def print_data_memory
    puts "Data Memory State: "
    (128..255).each do |index|
      value = @memory.get_data(index)
      puts "Memory[#{index}] = #{value}" unless value == 0 || value.nil?
    end
    puts
  end

end
