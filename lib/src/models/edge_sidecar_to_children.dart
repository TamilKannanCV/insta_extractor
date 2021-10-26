import 'package:insta_extractor/src/utils/api_utils.dart';

import 'content.dart';

class EdgeSidecarToChildren {
  final List<Content> contents;

  const EdgeSidecarToChildren(this.contents);

  factory EdgeSidecarToChildren.fromJson(Map<String, dynamic> response) {
    List<Map<String, dynamic>> edges = List.empty(growable: true);
    for (var node in (response[ApiUtils.edges] as List<dynamic>)) {
      edges.add(node as Map<String, dynamic>);
    }
    List<Content> contents = List.empty(growable: true);
    for (var data in edges) {
      contents.add(Content.fromJson(data[ApiUtils.node]));
    }

    return EdgeSidecarToChildren(contents);
  }
}
