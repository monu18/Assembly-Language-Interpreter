# frozen_string_literal: true

require_relative 'memory'
require_relative 'register'
require_relative 'instructions/instructions_loader'


class Interpreter
  def initialize
    @memory = Memory.new
    @registers = Register.new
    @instructions_loader = InstructionsLoader.new(@memory, @registers)
  end

  def start
    puts "Enter the SAL program file name: "
    filename = gets.chomp
    load_program(filename)

    command_loop
  end

  private

  def load_program(filename)
    File.readlines(filename).each_with_index do |line, index|
      @memory.program[index] = line.strip
    end
  end

  def command_loop
    loop do
      print "Enter command (s: step, a: run all, q: quit): "
      command = gets.chomp
      case command
      when 's'
        @instructions_loader.execute_next
      when 'a'
        @instructions_loader.execute_all
      when 'q'
        break
      else
        puts "Invalid command!"
      end
    end
  end
end

