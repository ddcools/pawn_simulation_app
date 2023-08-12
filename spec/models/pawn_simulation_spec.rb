# frozen_string_literal: true

# spec/models/pawn_simulation_spec.rb
require 'rails_helper'

RSpec.describe PawnSimulation do
  describe '#execute_commands' do
    it 'returns correct output for example input 1' do
      commands = [
        'PLACE 0,0,NORTH,WHITE',
        'MOVE 1',
        'REPORT'
      ]
      simulation = PawnSimulation.new(0, 0, 'SOUTH', 'BLACK')
      expect(simulation.execute_commands(commands)).to eq('0,1,NORTH,WHITE')
    end

    it 'returns correct output for example input 2' do
      commands = [
        'PLACE 0,0,NORTH,BLACK',
        'LEFT',
        'REPORT'
      ]
      simulation = PawnSimulation.new(0, 0, 'SOUTH', 'BLACK')
      expect(simulation.execute_commands(commands)).to eq('0,0,WEST,BLACK')
    end

    it 'returns correct output for example input 3' do
      commands = [
        'PLACE 1,2,EAST,BLACK',
        'MOVE 2',
        'MOVE 1',
        'LEFT',
        'MOVE',
        'REPORT'
      ]
      simulation = PawnSimulation.new(0, 0, 'SOUTH', 'BLACK')
      expect(simulation.execute_commands(commands)).to eq('3,3,NORTH,BLACK')
    end

    it 'returns nil for no REPORT command executed' do
      commands = [
        'PLACE 0,0,NORTH,BLACK',
        'LEFT'
      ]
      simulation = PawnSimulation.new(0, 0, 'SOUTH', 'BLACK')
      expect(simulation.execute_commands(commands)).to be_nil
    end

    it 'returns correct output for moving with steps' do
      commands = [
        'PLACE 2,2,EAST,WHITE',
        'MOVE 2',
        'REPORT'
      ]
      simulation = PawnSimulation.new(0, 0, 'SOUTH', 'BLACK')
      expect(simulation.execute_commands(commands)).to eq('4,2,EAST,WHITE')
    end

    it 'ignores MOVE command if it would result in falling off' do
      commands = [
        'PLACE 5,5,WEST,BLACK',
        'MOVE 3',
        'REPORT'
      ]
      simulation = PawnSimulation.new(0, 0, 'SOUTH', 'BLACK')
      expect(simulation.execute_commands(commands)).to eq('5,5,WEST,BLACK')
    end

    it 'handles multiple commands with proper sequence' do
      commands = [
        'PLACE 1,1,EAST,WHITE',
        'MOVE 1',
        'LEFT',
        'MOVE',
        'MOVE 2',
        'REPORT'
      ]
      simulation = PawnSimulation.new(0, 0, 'SOUTH', 'BLACK')
      expect(simulation.execute_commands(commands)).to eq('0,3,NORTH,WHITE')
    end

    it 'handles multiple commands with invalid sequence' do
      commands = [
        'MOVE 1',
        'LEFT',
        'REPORT'
      ]
      simulation = PawnSimulation.new(0, 0, 'SOUTH', 'BLACK')
      expect(simulation.execute_commands(commands)).to be_nil
    end
  end
end
