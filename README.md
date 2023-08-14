# Pawn Simulation

## Description

The Pawn Simulation application is a simulation of a pawn moving on an 8x8 chess board. The pawn can move on the board following specific rules and commands. The application prevents the pawn from falling off the board and allows it to perform various actions.

## Features

- Simulate the movement of a pawn on an 8x8 chess board.
- Commands supported: PLACE, MOVE, LEFT, RIGHT, REPORT.
- Pawn can move only to adjacent squares, not diagonally.
- Initial placement of the pawn using the PLACE command.
- Pawn's first move can be 1 or 2 squares.
- Pawn's direction can be NORTH, SOUTH, EAST, or WEST.
- Pawn's color can be White or Black.
- Support for multiple commands in sequence.
- Discards commands until a valid PLACE command is executed.
- Prevents pawn from falling off the board.
- UI with buttons and scrolling log to input and display results.

## Getting Started

1. Clone the repository: `git clone https://github.com/ddcools/pawn_simulation_app.git`
2. Navigate to the project directory: `cd pawn-simulation`
3. Install dependencies: `bundle install`
4. Start the server: `rails server`
5. Access the application in your browser at: `http://localhost:3000`

## Usage

1. Use the UI to input commands using buttons or enter them manually.
2. Commands include: PLACE X,Y,F,C, MOVE X, LEFT, RIGHT, REPORT.
3. Ensure that the first valid command is PLACE to initiate the pawn's position.
4. Observe the pawn's movement on the chess board and the results displayed.

## Example

Input:
```
PLACE 0,0,NORTH,WHITE
MOVE 1
REPORT
```
Output:
```
0,1,NORTH,WHITE
```

## Tests

Run the tests using RSpec:
```
bundle exec rspec
```

## Authors

- Dheeresha

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- This application was created as part of a coding challenge or project.