# frozen_string_literal: true

# PawnSimulation
class PawnSimulation
  # Constants for directions
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  # Initialize pawn's attributes
  def initialize(x, y, facing, color)
    @x = x.to_i
    @y = y.to_i
    @facing = facing
    @color = color
    @first_move = true
  end

  # Execute a list of commands
  def execute_commands(commands)
    valid_place_executed = false

    commands.each do |command|
      case command
      when /^PLACE (\d+),(\d+),(NORTH|EAST|SOUTH|WEST),(BLACK|WHITE)$/i
        x = $1.to_i
        y = $2.to_i
        facing = $3.upcase
        color = $4.upcase

        # Validate and update pawn's attributes with PLACE command
        if valid_placement?(x, y)
          @x = x
          @y = y
          @facing = facing
          @color = color
          @first_move = true
          valid_place_executed = true
        end
      when /^MOVE (\d)$/i
        steps = $1.to_i
        move(steps) if valid_place_executed
      when 'LEFT'
        turn_left if valid_place_executed
      when 'RIGHT'
        turn_right if valid_place_executed
      when 'REPORT'
        return "#{@x},#{@y},#{@facing},#{@color}" if valid_place_executed
      end
    end

    nil # Return nil if no REPORT command was executed
  end

  # Generate a 2D array to visualize the chessboard
  def visualize_chessboard_array
    board_size = 8
    chessboard = Array.new(board_size) { Array.new(board_size, '-') }
    chessboard[@y][@x] = 'P'
    chessboard
  end

  private

  # Check if placement is valid within the board
  def valid_placement?(x, y)
    board_size = 8
    x >= 0 && x < board_size && y >= 0 && y < board_size
  end

  # Check if move is valid
  def valid_move?(x, y, facing, steps)
    board_size = 8
    case facing
    when 'NORTH'
      y + steps <= board_size - 1
    when 'EAST'
      x + steps <= board_size - 1
    when 'SOUTH'
      y - steps >= 0
    when 'WEST'
      x - steps >= 0
    end
  end

  # Move the pawn
  def move(steps = 1)
    return unless valid_move?(@x, @y, @facing, steps)
  
    # Allow moving 1 or 2 steps only on the first move
    if @first_move
      return unless steps.between?(1, 2)
  
      @first_move = false
    end
  
    # Update pawn's position based on direction
    case @facing
    when 'NORTH'
      @y += steps
    when 'EAST'
      @x += steps
    when 'SOUTH'
      @y -= steps
    when 'WEST'
      @x -= steps
    end
  end

  # Turn the pawn left
  def turn_left
    @facing = DIRECTIONS[(DIRECTIONS.index(@facing) - 1) % DIRECTIONS.size]
  end

  # Turn the pawn right
  def turn_right
    @facing = DIRECTIONS[(DIRECTIONS.index(@facing) + 1) % DIRECTIONS.size]
  end
end
