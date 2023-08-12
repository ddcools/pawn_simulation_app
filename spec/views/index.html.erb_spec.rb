# spec/views/pawn_simulations/index.html.erb_spec.rb
require 'rails_helper'

RSpec.describe 'pawn_simulations/index.html.erb', type: :view do
  before do
    assign(:board_size, 8)
    assign(:report, '0,0,NORTH,BLACK')
    assign(:chessboard_array, [
      ['-', '-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', 'P', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-', '-']
    ])
    render
  end

  it 'renders the form' do
    expect(rendered).to have_selector('form[action="/execute_command_pawn_simulations"][method="post"]')
    expect(rendered).to have_selector('label[for="commands"]', text: 'Enter commands:')
    expect(rendered).to have_selector('textarea[name="commands"][rows="5"][cols="50"][placeholder*="Example: PLACE"]')
    expect(rendered).to have_button('Execute Commands')
  end

  it 'displays the simulation result' do
    expect(rendered).to have_selector('.simulation-result h2', text: 'Simulation Result:')
    expect(rendered).to have_selector('.simulation-result', text: '0,0,NORTH,BLACK')
  end

  it 'displays the chessboard' do
    expect(rendered).to have_selector('.chessboard h2', text: 'Board Output:')
    expect(rendered).to have_selector('.chessboard .chessboard-row', count: 8)
    expect(rendered).to have_selector('.chessboard .chessboard-cell', count: 64)
    expect(rendered).to have_selector('.chessboard .square-pawn', text: 'P')
  end
end
