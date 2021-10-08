import 'package:chess/easypieces.dart';
import 'package:chess/piece.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 8 squares in each row
  int row = 8;

  // 64 squares in total
  int totalNumberOfSquares = 64;

  // variables
  bool thisPieceIsSelected = false;
  int indexOfCurrentlySelectedPiece = -1;
  String colorOfCurrentlySelectedPiece = 'white';
  String currentlySelectedPiece = '';

  var deadWhitePieces = [];
  var deadBlackPieces = [];
  bool whiteTurn = true; // white goes first, then black goes

  List<int> blackSquares = [
    0,
    2,
    4,
    6,
    9,
    11,
    13,
    15,
    0 + 16,
    2 + 16,
    4 + 16,
    6 + 16,
    9 + 16,
    11 + 16,
    13 + 16,
    15 + 16,
    0 + 2 * 16,
    2 + 2 * 16,
    4 + 2 * 16,
    6 + 2 * 16,
    9 + 2 * 16,
    11 + 2 * 16,
    13 + 2 * 16,
    15 + 2 * 16,
    0 + 3 * 16,
    2 + 3 * 16,
    4 + 3 * 16,
    6 + 3 * 16,
    9 + 3 * 16,
    11 + 3 * 16,
    13 + 3 * 16,
    15 + 3 * 16,
  ];

  var pieces = [
    // [position, piece, color, selected, possible kill]

    // black pieces
    [0, 'rook', 'black', 'unselected', ''],
    [1, 'knight', 'black', 'unselected', ''],
    [2, 'bishop', 'black', 'unselected', ''],
    [3, 'queen', 'black', 'unselected', ''],
    [4, 'king', 'black', 'unselected', ''],
    [5, 'bishop', 'black', 'unselected', ''],
    [6, 'knight', 'black', 'unselected', ''],
    [7, 'rook', 'black', 'unselected', ''],
    [8, 'pawn', 'black', 'unselected', ''],
    [9, 'pawn', 'black', 'unselected', ''],
    [10, 'pawn', 'black', 'unselected', ''],
    [11, 'pawn', 'black', 'unselected', ''],
    [12, 'pawn', 'black', 'unselected', ''],
    [13, 'pawn', 'black', 'unselected', ''],
    [14, 'pawn', 'black', 'unselected', ''],
    [15, 'pawn', 'black', 'unselected', ''],

    // open spaces -> x = blank, o = possible move, k = possible kill
    [16, 'x', '', '', ''],
    [17, 'x', '', '', ''],
    [18, 'x', '', '', ''],
    [19, 'x', '', '', ''],
    [20, 'x', '', '', ''],
    [21, 'x', '', '', ''],
    [22, 'x', '', '', ''],
    [23, 'x', '', '', ''],
    [24, 'x', '', '', ''],
    [25, 'x', '', '', ''],
    [26, 'x', '', '', ''],
    [27, 'x', '', '', ''],
    [28, 'x', '', '', ''],
    [29, 'x', '', '', ''],
    [30, 'x', '', '', ''],
    [31, 'x', '', '', ''],
    [32, 'x', '', '', ''],
    [33, 'x', '', '', ''],
    [34, 'x', '', '', ''],
    [35, 'x', '', '', ''],
    [36, 'x', '', '', ''],
    [37, 'x', '', '', ''],
    [38, 'x', '', '', ''],
    [39, 'x', '', '', ''],
    [40, 'x', '', '', ''],
    [41, 'x', '', '', ''],
    [42, 'x', '', '', ''],
    [43, 'x', '', '', ''],
    [44, 'x', '', '', ''],
    [45, 'x', '', '', ''],
    [46, 'x', '', '', ''],
    [47, 'x', '', '', ''],

    // white pieces

    [48, 'pawn', 'white', 'unselected', ''],
    [49, 'pawn', 'white', 'unselected', ''],
    [50, 'pawn', 'white', 'unselected', ''],
    [51, 'pawn', 'white', 'unselected', ''],
    [52, 'pawn', 'white', 'unselected', ''],
    [53, 'pawn', 'white', 'unselected', ''],
    [54, 'pawn', 'white', 'unselected', ''],
    [55, 'pawn', 'white', 'unselected', ''],
    [56, 'rook', 'white', 'unselected', ''],
    [57, 'knight', 'white', 'unselected', ''],
    [58, 'bishop', 'white', 'unselected', ''],
    [59, 'king', 'white', 'unselected', ''],
    [60, 'queen', 'white', 'unselected', ''],
    [61, 'bishop', 'white', 'unselected', ''],
    [62, 'knight', 'white', 'unselected', ''],
    [63, 'rook', 'white', 'unselected', ''],
  ];

  // overall tap function
  void tappedPiece(int index) {
    print(currentlySelectedPiece + ', ' + colorOfCurrentlySelectedPiece);
    // if the tapped position is an available move, move the piece to that position
    if (pieces[index][1] == 'o') {
      setState(() {
        pieces[index][1] = currentlySelectedPiece;
        pieces[index][2] =
            colorOfCurrentlySelectedPiece == 'white' ? 'white' : 'black';
        pieces[indexOfCurrentlySelectedPiece][1] = 'x';
        pieces[indexOfCurrentlySelectedPiece][2] = ' ';
      });
      unselectEverything();
    }

    // if the tapped position is a kill move, move the piece to that position
    else if (pieces[index][4] == 'k') {
      // record the pieces that are dead
      if (pieces[index][2] == 'white') {
        deadWhitePieces.add([pieces[index][1], pieces[index][2]]);
      } else if (pieces[index][2] == 'black') {
        deadBlackPieces.add([pieces[index][1], pieces[index][2]]);
      }
      print(deadWhitePieces);
      setState(() {
        pieces[index][1] = currentlySelectedPiece;
        pieces[index][2] =
            colorOfCurrentlySelectedPiece == 'white' ? 'white' : 'black';
        pieces[indexOfCurrentlySelectedPiece][1] = 'x';
        pieces[indexOfCurrentlySelectedPiece][2] = ' ';
      });

      unselectEverything();
    }
    // select current piece
    else {
      unselectEverything();
      setState(() {
        indexOfCurrentlySelectedPiece = index;
        colorOfCurrentlySelectedPiece = pieces[index][2];
        pieces[index][3] = 'selected';
        currentlySelectedPiece = pieces[index][1];
      });
      // check what the piece is, then show available moves for that piece
      switch (pieces[index][1]) {
        case 'pawn':
          tappedPawn(index);
          break;
        case 'rook':
          tappedRook(index);
          break;
        case 'knight':
          tappedKnight(index);
          break;
        case 'bishop':
          tappedBishop(index);
          break;
        case 'queen':
          tappedQueen(index);
          break;
        case 'king':
          tappedKing(index);
          break;
        default:
      }
    }
  }

  // unselect everything
  void unselectEverything() {
    setState(() {
      for (int i = 0; i < pieces.length; i++) {
        pieces[i][3] = 'unselected';
        if (pieces[i][1] == 'o') {
          pieces[i][1] = 'x';
        }
        if (pieces[i][4] == 'k') {
          pieces[i][4] = '';
        }
      }
    });
  }

  // tapped pawn
  void tappedPawn(int index) {
    // color matters for pawns as they can only move 'forward'

    setState(() {
      // WHITE PAWN
      // show available moves
      if (pieces[index][2] == 'white') {
        // check if the square infront of the pawn is blank, if it's not..
        if (pieces[index - row][1] != 'x') {
          // do nothing
        }
        // only when pawns are in the 2nd row can they move 2 squares
        else if (index >= totalNumberOfSquares - 2 * row &&
            index <= totalNumberOfSquares - row) {
          // if there is a piece on the 2nd square above the pawn
          if (pieces[index - 2 * row][1] != 'x') {
            // only available move is 1 square above
            pieces[index - row][1] = 'o';
          }
          // available squares are 1 and 2 above
          else {
            pieces[index - row][1] = 'o';
            pieces[index - row * 2][1] = 'o';
          }
        }

        // after that, pawns can only move 1 square
        else {
          pieces[index - row][1] = 'o';
        }

        // if there is an enemy piece diagonal to the currently tapped pawn,
        // it's a possible kill move
        if (pieces[index - row - 1][1] != 'x' &&
            pieces[index - row - 1][2] == 'black') {
          pieces[index - row - 1][4] = 'k';
        }
        if (pieces[index - row + 1][1] != 'x' &&
            pieces[index - row + 1][2] == 'black') {
          pieces[index - row + 1][4] = 'k';
        }
      }

      // BLACK PAWN
      // show available moves
      else if (pieces[index][2] == 'black') {
        // check if the square infront of the pawn is blank, if it's not..
        if (pieces[index + row][1] != 'x') {
          // do nothing
        }
        // only when pawns are in the 2nd row can they move 2 squares
        else if (index >= row && index <= 2 * row) {
          // if there is a piece on the 2nd square above the pawn
          if (pieces[index + 2 * row][1] != 'x') {
            // only available move is 1 square above
            pieces[index + row][1] = 'o';
          }
          // available squares are 1 and 2 above
          else {
            pieces[index + row][1] = 'o';
            pieces[index + row * 2][1] = 'o';
          }
        }

        // after that, pawns can only move 1 square
        else {
          pieces[index + row][1] = 'o';
        }
        // if there is an enemy piece diagonal to the currently tapped pawn,
        // it's a possible kill move
        if (pieces[index + row - 1][1] != 'x' &&
            pieces[index + row - 1][2] == 'white') {
          pieces[index + row - 1][4] = 'k';
        }
        if (pieces[index + row + 1][1] != 'x' &&
            pieces[index + row + 1][2] == 'white') {
          pieces[index + row + 1][4] = 'k';
        }
      }
    });
  }

  // tapped rook
  void tappedRook(int index) {
    List<int> possibleMoves = [];

    // there is a max of 7 moves that a rook can go in any particular direction
    // add all the positions to possibleMoves until there is a piece in the way

    // UP
    for (int i = 1; i < 8; i++) {
      if (withinTheBoard(index - i * row)) {
        if (pieces[index - i * row][1] != 'x') {
          if (pieces[index - i * row][2] != colorOfCurrentlySelectedPiece) {
            pieces[index - i * row][4] = 'k';
          }
          break;
        } else {
          possibleMoves.add(index - i * row);
        }
      }
    }

    // DOWN
    for (int i = 1; i < 8; i++) {
      if (withinTheBoard(index + i * row)) {
        if (pieces[index + i * row][1] != 'x') {
          if (pieces[index + i * row][2] != colorOfCurrentlySelectedPiece) {
            pieces[index + i * row][4] = 'k';
          }
          break;
        } else {
          possibleMoves.add(index + i * row);
        }
      }
    }

    // left and right need a little extra adustment
    // so that it doesn't flow off to the next rows

    // LEFT
    for (int i = 1; i < index % 8 + 1; i++) {
      if (withinTheBoard(index - i)) {
        if (pieces[index - i][1] != 'x') {
          if (pieces[index - i][2] != colorOfCurrentlySelectedPiece) {
            pieces[index - i][4] = 'k';
          }
          break;
        } else {
          possibleMoves.add(index - i);
        }
      }
    }

    // RIGHT
    for (int i = 1; i < 8 - index % 8; i++) {
      if (withinTheBoard(index + i)) {
        if (pieces[index + i][1] != 'x') {
          if (pieces[index + i][2] != colorOfCurrentlySelectedPiece) {
            pieces[index + i][4] = 'k';
          }
          break;
        } else {
          possibleMoves.add(index + i);
        }
      }
    }

    setState(() {
      for (int i = 0; i < possibleMoves.length; i++) {
        pieces[possibleMoves[i]][1] = 'o';
      }
    });
  }

  // tapped knight
  void tappedKnight(int index) {
    // total possible moves for knight, but we can't included everything in this
    // list depending on where we are, otherwise the move will spill over to the next column
    List<int> possibleMoves = [
      index - 2 * row - 1, // don't include if index is in first column
      index - 2 * row + 1, // don't include if index is in last column
      index + 2 * row - 1, // don't include if index is in first column
      index + 2 * row + 1, // don't include if index is in last column
      index - row + 2, // don't include if index is in 1st/2nd last column
      index - row - 2, // don't include if index is in 1st/2nd column
      index + row + 2, // don't include if index is in 1st/2nd last column
      index + row - 2, // don't include if index is in 1st/2nd column
    ];

    switch (index % 8) {
      // first column
      case 0:
        possibleMoves = [
          index - 2 * row + 1, // don't include if index is in last column
          index + 2 * row + 1, // don't include if index is in last column
          index - row + 2, // don't include if index is in 1st/2nd last column
          index + row + 2, // don't include if index is in 1st/2nd last column
        ];
        break;
      // second column
      case 1:
        possibleMoves = [
          index - 2 * row - 1, // don't include if index is in first column
          index - 2 * row + 1, // don't include if index is in last column
          index + 2 * row - 1, // don't include if index is in first column
          index + 2 * row + 1, // don't include if index is in last column
          index - row + 2, // don't include if index is in 1st/2nd last column
          index + row + 2, // don't include if index is in 1st/2nd last column
        ];
        break;
      // second last column
      case 6:
        possibleMoves = [
          index - 2 * row - 1, // don't include if index is in first column
          index - 2 * row + 1, // don't include if index is in last column
          index + 2 * row - 1, // don't include if index is in first column
          index + 2 * row + 1, // don't include if index is in last column
          index - row - 2, // don't include if index is in 1st/2nd column
          index + row - 2, // don't include if index is in 1st/2nd column
        ];
        break;
      // last column
      case 7:
        possibleMoves = [
          index - 2 * row - 1, // don't include if index is in first column
          index + 2 * row - 1, // don't include if index is in first column
          index - row - 2, // don't include if index is in 1st/2nd column
          index + row - 2, // don't include if index is in 1st/2nd column
        ];
        break;

      default:
    }

    setState(() {
      for (int i = 0; i < possibleMoves.length; i++) {
        // first check that the place you are trying to go is on the board (0 <= index <= 63)
        if (withinTheBoard(possibleMoves[i])) {
          // if the place you're trying to go to is blank (x)
          if (pieces[possibleMoves[i]][1] == 'x') {
            // then it is an available position (o)
            pieces[possibleMoves[i]][1] = 'o';
          } // if the place you're trying to go to is NOT blank and is the opponent's piece
          else if (pieces[possibleMoves[i]][1] != 'x' &&
              colorOfCurrentlySelectedPiece != pieces[possibleMoves[i]][2]) {
            // then it a possible kill move
            pieces[possibleMoves[i]][4] = 'k';
          }
        }
      }
    });
  }

  // tapped bishop
  void tappedBishop(int index) {
    List<int> possibleMoves = [];

    // up left diagonal
    for (int i = 1; i < index % 8 + 1; i++) {
      if (withinTheBoard(index - i * row - i)) {
        if (pieces[index - i * row - i][1] != 'x') {
          if (pieces[index - i * row - i][2] != colorOfCurrentlySelectedPiece) {
            pieces[index - i * row - i][4] = 'k';
          }
          break;
        } else {
          possibleMoves.add(index - i * row - i);
        }
      }
    }

    // up right diagonal
    for (int i = 1; i < 8 - index % 8; i++) {
      if (withinTheBoard(index - i * row + i)) {
        if (pieces[index - i * row + i][1] != 'x') {
          if (pieces[index - i * row + i][2] != colorOfCurrentlySelectedPiece) {
            pieces[index - i * row + i][4] = 'k';
          }
          break;
        } else {
          possibleMoves.add(index - i * row + i);
        }
      }
    }

    // down left diagonal
    for (int i = 1; i < index % 8 + 1; i++) {
      if (withinTheBoard(index + i * row - i)) {
        if (pieces[index + i * row - i][1] != 'x') {
          if (pieces[index + i * row - i][2] != colorOfCurrentlySelectedPiece) {
            pieces[index + i * row - i][4] = 'k';
          }
          break;
        } else {
          possibleMoves.add(index + i * row - i);
        }
      }
    }

    // down right diagonal
    for (int i = 1; i < 8 - index % 8; i++) {
      if (withinTheBoard(index + i * row + i)) {
        if (pieces[index + i * row + i][1] != 'x') {
          if (pieces[index + i * row + i][2] != colorOfCurrentlySelectedPiece) {
            pieces[index + i * row + i][4] = 'k';
          }
          break;
        } else {
          possibleMoves.add(index + i * row + i);
        }
      }
    }

    setState(() {
      for (int i = 0; i < possibleMoves.length; i++) {
        pieces[possibleMoves[i]][1] = 'o';
      }
    });
  }

  // tapped queen
  void tappedQueen(int index) {
    tappedBishop(index);
    tappedRook(index);
  }

  // tapped king
  void tappedKing(int index) {
    List<int> possibleMoves = [];

    // king can go up, left, down, right, and 4 diagonals

    // UP
    if (withinTheBoard(index - row)) {
      if (pieces[index - row][1] != 'x') {
        if (pieces[index - row][2] != colorOfCurrentlySelectedPiece) {
          pieces[index - row][4] = 'k';
        }
      } else {
        possibleMoves.add(index - row);
      }
    }

    // DOWN
    if (withinTheBoard(index + row)) {
      if (pieces[index + row][1] != 'x') {
        if (pieces[index + row][2] != colorOfCurrentlySelectedPiece) {
          pieces[index + row][4] = 'k';
        }
      } else {
        possibleMoves.add(index + row);
      }
    }

    // LEFT
    if (withinTheBoard(index - 1)) {
      if (pieces[index - 1][1] != 'x') {
        if (pieces[index - 1][2] != colorOfCurrentlySelectedPiece) {
          pieces[index - 1][4] = 'k';
        }
      } else {
        possibleMoves.add(index - 1);
      }
    }

    // RIGHT
    if (withinTheBoard(index + 1)) {
      if (pieces[index + 1][1] != 'x') {
        if (pieces[index + 1][2] != colorOfCurrentlySelectedPiece) {
          pieces[index + 1][4] = 'k';
        }
      } else {
        possibleMoves.add(index + 1);
      }
    }

    // UP LEFT DIAGONAL
    if (withinTheBoard(index - row - 1)) {
      if (pieces[index - row - 1][1] != 'x') {
        if (pieces[index - row - 1][2] != colorOfCurrentlySelectedPiece) {
          pieces[index - row - 1][4] = 'k';
        }
      } else {
        possibleMoves.add(index - row - 1);
      }
    }

    // UP RIGHT DIAGONAL
    if (withinTheBoard(index - row + 1)) {
      if (pieces[index - row + 1][1] != 'x') {
        if (pieces[index - row + 1][2] != colorOfCurrentlySelectedPiece) {
          pieces[index - row + 1][4] = 'k';
        }
      } else {
        possibleMoves.add(index - row + 1);
      }
    }

    // DOWN LEFT DIAGONAL
    if (withinTheBoard(index + row - 1)) {
      if (pieces[index + row - 1][1] != 'x') {
        if (pieces[index + row - 1][2] != colorOfCurrentlySelectedPiece) {
          pieces[index + row - 1][4] = 'k';
        }
      } else {
        possibleMoves.add(index + row - 1);
      }
    }

    // UP LEFT DIAGONAL
    if (withinTheBoard(index + row + 1)) {
      if (pieces[index + row + 1][1] != 'x') {
        if (pieces[index + row + 1][2] != colorOfCurrentlySelectedPiece) {
          pieces[index + row + 1][4] = 'k';
        }
      } else {
        possibleMoves.add(index + row + 1);
      }
    }

    setState(() {
      for (int i = 0; i < possibleMoves.length; i++) {
        pieces[possibleMoves[i]][1] = 'o';
      }
    });
  }

  // returns true if a given index is between 0 ~ 63
  bool withinTheBoard(int index) {
    if (index >= 0 && index <= 63) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                itemCount: deadBlackPieces.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8),
                itemBuilder: (BuildContext context, int index) {
                  return EasyPiece(
                    piece: deadBlackPieces[index][0],
                    color: deadBlackPieces[index][1],
                  );
                }),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                children: [
//                  SizedBox(height: 15),
                  Expanded(
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 64,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: row),
                        itemBuilder: (BuildContext context, int index) {
                          if (index == pieces[index][0]) {
                            return Container(
                              color: blackSquares.contains(index)
                                  ? Colors.brown[300]
                                  : Colors.white,
                              child: MyPiece(
                                piece: pieces[index][1],
                                color: pieces[index][2],
                                killMove: pieces[index][4],
                                onTap: () {
                                  tappedPiece(index);
                                },
                                thisPieceIsSelected: pieces[index][3],
                              ),
                            );
                          } else {
                            return Container(
                              color: blackSquares.contains(index)
                                  ? Colors.grey
                                  : Colors.white,
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: GridView.builder(
                  reverse: true,
                  itemCount: deadWhitePieces.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8),
                  itemBuilder: (BuildContext context, int index) {
                    return EasyPiece(
                      piece: deadWhitePieces[index][0],
                      color: deadWhitePieces[index][1],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
