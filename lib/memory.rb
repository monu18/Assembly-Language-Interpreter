# frozen_string_literal: true

class Memory
  attr_accessor :program, :data, :symbol_table

  def initialize
    @program = Array.new(128, 0)        # Program memory
    @data = Array.new(128, 0)           # Data memory
    @symbol_table = {}                  # Symbol table for variables
    @next_available_address = 128       # Start of data memory (addresses 128-255)
  end

  def get_program_instruction(address)
    @program[address]
  end

  def get_data(address)
    @data[address]
  end

  def set_data(address, value)
    @data[address] = value
  end

  # Allocate a new address for a symbol in data memory if it doesn't already exist
  def allocate_symbol(symbol)
    return @symbol_table[symbol] if @symbol_table.key?(symbol)

    if @next_available_address <= 255
      @symbol_table[symbol] = @next_available_address
      @next_available_address += 1
      @symbol_table[symbol]
    else
      raise "Out of memory: No more space for new symbols."
    end
  end

  # Get the address for a given symbol
  def get_address(symbol)
    @symbol_table[symbol] || raise("Symbol '#{symbol}' not declared.")
  end
end
