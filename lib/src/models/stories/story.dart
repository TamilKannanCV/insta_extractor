import 'package:insta_extractor/src/utils/api_utils.dart';

import 'details/tray.dart';

class Story {
  final List<Tray> trays;

  const Story(this.trays);

  factory Story.fromJson(Map<String, dynamic> response) {
    List<Tray> trays = List.empty(growable: true);
    for (var data in (response[ApiUtils.tray] as List<dynamic>)) {
      trays.add(Tray.fromJson(data));
    }

    return Story(trays);
  }
}
