# frozen_string_literal: true

# PawnSimulationsController
class PawnSimulationsController < ApplicationController
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
end
