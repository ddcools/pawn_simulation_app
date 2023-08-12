# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pawn_simulations, only: [:index] do
    post 'execute_command', on: :collection
  end
end
