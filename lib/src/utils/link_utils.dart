abstract class LinkUtils {
  static const String kInstagramPattern = "(?<required>(http(s)?:\\/\\/((w){3}.)?instagram\\.com\\/)([A-z_0-9._\\w]+\\/|)((p|reel|tv)\\/(?<id>[A-z-_0-9\\w]+)\\/))";
  static const String kInstaStoryPattern = "(?<required>(http(s)?:\\/\\/((w){3}.)?instagram.com\\/stories\\/)(?<username>[A-Za-z-_.0-9\\w]+)(\\/[0-9]+)\\/?)";

  static String getUsername(String url) {
    var matches = RegExp(kInstaStoryPattern).firstMatch(url);
    return "${matches!.namedGroup("username")}";
  }

  static bool isInstaUrl(String url) {
    return RegExp(kInstaStoryPattern).hasMatch(url) || RegExp(kInstagramPattern).hasMatch(url);
  }

  static bool isStoryUrl(String url) {
    return RegExp(kInstaStoryPattern).hasMatch(url);
  }
}

abstract class ParseLink {
  ///Returns the downloadable instagram link
  ///Format: https://instagram.com/p/abc/ (sample)
  static String instagram(String url) {
    if (url.contains("stories")) {
      var matches = RegExp(LinkUtils.kInstaStoryPattern).firstMatch(url);
      return "${matches!.namedGroup("required")}";
    }
    var matches = RegExp(LinkUtils.kInstagramPattern).firstMatch(url);
    return "${matches!.namedGroup("required")}";
  }
}
