import 'package:chinese_picross/utilities/models/game.dart';
import 'package:chinese_picross/utilities/models/description.dart';
import 'package:chinese_picross/utilities/models/picross.dart';

List<Picross> picrossList = [
  Picross(number: 0,
    game: Game(
      correctTiles: [0, 2, 4, 6, 8, 20, 35, 36, 37, 40, 60, 90, 92],
      gameNumber: 0,
    ),
    description: Description(
        character: 'A', chinesePronunciation: 'ba', meaning: 'Nothing'),
  ),
  Picross(number: 1,
      game: Game(
        correctTiles: [34, 35, 44, 45],
        gameNumber: 1,
      ),
      description: Description(
          character: 'A', chinesePronunciation: 'ba', meaning: 'Nothing')),
  Picross(number: 2,
      game: Game(gameNumber: 2,
        correctTiles: [0, 1, 8, 9, 10, 11, 18, 19, 20, 21, 28, 29, 30 ,31, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53,54,55,56,57,58,59,60, 61, 68,69,70,71,78,79,80,81,88,89,90,91,98,99],
      ),
      description: Description(
          character: '工', chinesePronunciation: 'gōng', meaning: 'Work')),
  Picross(number: 3,
      game: Game(
        gameNumber: 3,
        correctTiles: [1,3,7,11,12,13,15,19,20,21,23,24,25,26,27,28,29,31,32,33,35,41,43,47,49,58,59,61,62,63,64,65, 66, 67, 71,74,81,84,85,86,87,88,89,90,94],
      ),
      description: Description(
          character: '新', chinesePronunciation: 'xīn', meaning: 'New')),
  Picross(number: 4,
      game: Game(
        gameNumber: 4,
        correctTiles: [34, 35, 44, 45],
      ),
      description: Description(
          character: 'A', chinesePronunciation: 'ba', meaning: 'Nothing')),
  Picross(number: 5,
      game: Game(
        gameNumber: 5,
        correctTiles: [3, 5, 12, 13, 15, 16, 17, 18, 19, 22, 24, 32, 34, 57, 60, 61, 62, 63, 65, 67, 68, 70, 71, 73, 75, 77, 79, 80, 81, 83, 85, 86, 87, 88, 89, 90, 91, 92, 93, 95, 97],
      ),
      description: Description(
          character: '得', chinesePronunciation: 'dé', meaning: 'Obtain')),
];
