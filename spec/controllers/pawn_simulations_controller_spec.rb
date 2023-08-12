# frozen_string_literal: true

# spec/controllers/pawn_simulations_controller_spec.rb
require 'rails_helper'

RSpec.describe PawnSimulationsController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @board_size' do
      get :index
      expect(assigns(:board_size)).to eq(8)
    end

    it 'assigns @report as nil' do
      get :index
      expect(assigns(:report)).to be_nil
    end
  end

  describe 'POST #execute_command' do
    it 'assigns @report and @chessboard_array' do
      post :execute_command, params: { commands: "PLACE 0,0,NORTH,BLACK\nREPORT" }
      expect(assigns(:report)).to eq('0,0,NORTH,BLACK')
      expect(assigns(:chessboard_array)).to be_an(Array)
    end

    it 'renders the index template' do
      post :execute_command, params: { commands: "PLACE 0,0,NORTH,BLACK\nREPORT" }
      expect(response).to render_template(:index)
    end
  end
end
