# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pawn_simulations#index'

  resources :pawn_simulations, only: [:index] do
    post 'execute_command', on: :collection
  end

  get '*path', to: 'errors#not_found', via: :all
end
