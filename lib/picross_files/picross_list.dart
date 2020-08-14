import 'package:chinese_picross/utilities/models/game.dart';
import 'package:chinese_picross/utilities/models/description.dart';
import 'package:chinese_picross/utilities/models/picross.dart';
import 'package:chinese_picross/utilities/models/example.dart';

List<Picross> picrossList = [
  Picross(number: 0,
    game: Game(
      correctTiles: [0, 2, 4, 6, 8, 20, 35, 36, 37, 40, 60, 90, 92],
      gameNumber: 0,
    ),
    description: Description(
        character: 'A', chinesePronunciation: 'ba', meaning: 'Nothing'),
    examples: [Example(
      word: '出租车司机',
      meaning: 'Taxi driver'
    ),
      Example(
          word: '出租车司机',
          meaning: 'Taxi driver'
      ),
      Example(
          word: '出租车司机',
          meaning: 'Taxi driver'
      ),]
  ),
  Picross(number: 1,
      game: Game(
        correctTiles: [34, 35, 44, 45],
        gameNumber: 1,
      ),
      description: Description(
          character: 'A', chinesePronunciation: 'ba', meaning: 'Hajle Selassie'),
      examples: [Example(
      word: '出租车司机',
      meaning: 'Taxi driver'
  ),
  Example(
      word: '出租车司机',
      meaning: 'Taxi driver'
  ),
  Example(
      word: '出租车司机',
      meaning: 'Taxi driver'
  ),
        Example(
            word: '司机',
            meaning: 'Driver'
        )]),

  Picross(number: 2,
      game: Game(gameNumber: 2,
        correctTiles: [0, 1, 8, 9, 10, 11, 18, 19, 20, 21, 28, 29, 30 ,31, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53,54,55,56,57,58,59,60, 61, 68,69,70,71,78,79,80,81,88,89,90,91,98,99],
      ),
      description: Description(
          character: '工', chinesePronunciation: 'gōng', meaning: 'Work'),
examples: [Example(
word: '出租车司机',
meaning: 'Taxi driver'
),
Example(
word: '出租车司机',
meaning: 'Taxi driver'
),
Example(
word: '出租车司机',
meaning: 'Taxi driver'
),]),
  Picross(number: 3,
      game: Game(
        gameNumber: 3,
        correctTiles: [1,3,7,11,12,13,15,19,20,21,23,24,25,26,27,28,29,31,32,33,35,41,43,47,49,58,59,61,62,63,64,65, 66, 67, 71,74,81,84,85,86,87,88,89,90,94],
      ),
      description: Description(
          character: '新', chinesePronunciation: 'xīn', meaning: 'New'),
examples: [Example(
word: '出租车司机',
meaning: 'Taxi driver'
),
Example(
word: '出租车司机',
meaning: 'Taxi driver'
),
Example(
word: '出租车司机',
meaning: 'Taxi driver'
),]),
  Picross(number: 4,
      game: Game(
        gameNumber: 4,
        correctTiles: [34, 35, 44, 45],
      ),
      description: Description(
          character: 'A', chinesePronunciation: 'ba', meaning: 'Nothing'), examples: [Example(
          word: '出租车司机',
          meaning: 'Taxi driver'
      ),
        Example(
            word: '出租车司机',
            meaning: 'Taxi driver'
        ),
        Example(
            word: '出租车司机',
            meaning: 'Taxi driver'
        ),]),
  Picross(number: 5,
      game: Game(
        gameNumber: 5,
        correctTiles: [3, 5, 12, 13, 15, 16, 17, 18, 19, 22, 24, 32, 34, 57, 60, 61, 62, 63, 65, 67, 68, 70, 71, 73, 75, 77, 79, 80, 81, 83, 85, 86, 87, 88, 89, 90, 91, 92, 93, 95, 97],
      ),
      description: Description(
          character: '得', chinesePronunciation: 'dé', meaning: 'Obtain'), examples: [Example(
          word: '出租车司机',
          meaning: 'Taxi driver'
      ),
        Example(
            word: '出租车司机',
            meaning: 'Taxi driver'
        ),
        Example(
            word: '出租车司机',
            meaning: 'Taxi driver'
        ),]),
  Picross(number: 6,
      game: Game(
        gameNumber: 6,
        correctTiles: [7, 8, 13, 14, 16, 17, 21, 22, 24, 26, 31, 34, 38, 39, 41, 44, 49, 50, 51, 53, 54, 55, 56, 57, 58, 59, 60, 64, 70, 74, 75, 76, 80, 84, 86, 87, 90, 94, 97, 98]
      ),
      description: Description(
          character: '乐', chinesePronunciation: 'lè', meaning: 'Pleasure'),
      examples: [
        Example(
          word: '快乐',
          meaning: 'Happy'
      ),
        Example(
            word: '乐趣',
            meaning: 'Joy'
        ),
        Example(
            word: '乐观',
            meaning: 'Optimistic'
        ),]),
  Picross(number: 7,
      game: Game(
          gameNumber: 7,
          correctTiles: [1, 3, 5, 10, 13, 14, 15, 16, 17, 18, 19, 21, 23, 25, 29, 31, 35, 38, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 62, 64, 65, 66, 69, 70, 72, 74, 76, 77, 80, 82, 84, 87, 88, 90, 91, 92, 93, 94, 97, 99]
      ),
      description: Description(
          character: '银', chinesePronunciation: 'yín', meaning: 'Silver'),
      examples: [
        Example(
            word: '银行',
            meaning: 'Bank'
        ),
        Example(
            word: '银河',
            meaning: 'Milky Way'
        ),
        Example(
            word: '银幕',
            meaning: 'Screen'
        ),]),
];



