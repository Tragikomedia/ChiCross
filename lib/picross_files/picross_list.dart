import 'package:chinese_picross/utilities/models/game.dart';
import 'package:chinese_picross/utilities/models/description.dart';
import 'package:chinese_picross/utilities/models/picross.dart';

List<Picross> picrossList = [
  Picross(number: 0,
    game: Game(
      correctTiles: [0, 2, 4, 6, 8, 20, 35, 36, 37, 40, 60, 90, 92],
    ),
    description: Description(
        character: 'A', chinesePronunciation: 'ba', meaning: 'Nothing'),
  ),
  Picross(number: 1,
      game: Game(
        correctTiles: [34, 35, 44, 45],
      ),
      description: Description(
          character: 'A', chinesePronunciation: 'ba', meaning: 'Nothing')),
  Picross(number: 2,
      game: Game(
        correctTiles: [34, 35, 44, 45],
      ),
      description: Description(
          character: 'A', chinesePronunciation: 'ba', meaning: 'Nothing')),
  Picross(number: 3,
      game: Game(
        correctTiles: [34, 35, 44, 45],
      ),
      description: Description(
          character: 'A', chinesePronunciation: 'ba', meaning: 'Nothing')),
  Picross(number: 4,
      game: Game(
        correctTiles: [34, 35, 44, 45],
      ),
      description: Description(
          character: 'A', chinesePronunciation: 'ba', meaning: 'Nothing')),
];
