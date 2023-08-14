# frozen_string_literal: true

# PawnSimulationsController
class PawnSimulationsController < ApplicationController
  before_action :validate_commands, only: :execute_command

  def index
    @board_size = 8
    @report = nil
  end

  def execute_command
    commands = params[:commands].split("\n").map(&:strip)
    simulation = PawnSimulation.new(0, 0, 'SOUTH', 'BLACK')
    @report = simulation.execute_commands(commands)
    @chessboard_array = simulation.visualize_chessboard_array

    render :index
  end

  private

  def validate_commands
    commands = params[:commands].split("\n").map(&:strip)
    valid_place_executed = false

    commands.each do |command|
      case command
      when /^PLACE (\d+),(\d+),(NORTH|EAST|SOUTH|WEST),(BLACK|WHITE)$/i
        valid_place_executed = true
        break
      end
    end

    return if valid_place_executed

    flash[:alert] = 'A valid PLACE command is required before other commands.'
    redirect_to root_path
  end
end
