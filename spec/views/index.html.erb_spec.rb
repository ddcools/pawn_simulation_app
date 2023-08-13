# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "pawn_simulations/index", type: :view do
  it "renders the form" do
    render
    expect(rendered).to have_selector('textarea[name="commands"][rows="5"][cols="50"]')
    expect(rendered).to have_selector('input[type="submit"][value="Execute Commands"]')
  end

  it "displays the simulation result if present" do
    assign(:report, "3,3,NORTH,BLACK")
    render
    expect(rendered).to have_selector('.simulation-result h2', text: 'Simulation Result:')
    expect(rendered).to have_content('3,3,NORTH,BLACK')
  end

  it "displays the chessboard if not blank" do
    assign(:chessboard_array, [['-', 'P'], ['-', '-']])
    render
    expect(rendered).to have_selector('.chessboard h2', text: 'Board Output:')
  end

  it "does not display the chessboard if blank" do
    assign(:chessboard_array, [])
    render
    expect(rendered).to_not have_selector('.chessboard')
  end
end
