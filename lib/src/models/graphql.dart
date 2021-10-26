import 'shortcode_media.dart';

class Graphql {
  final ShortcodeMedia shortcodeMedia;

  const Graphql(this.shortcodeMedia);

  factory Graphql.fromJson(Map<String, dynamic> response) {
    ShortcodeMedia shortcodeMedia =
        ShortcodeMedia.fromJson(response["graphql"]["shortcode_media"]);
    return Graphql(shortcodeMedia);
  }
}
