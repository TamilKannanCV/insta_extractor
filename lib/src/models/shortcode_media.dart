import 'package:insta_extractor/src/utils/api_utils.dart';

import 'edge_sidecar_to_children.dart';

import 'content.dart';
import 'owner.dart';

class ShortcodeMedia {
  final Content content;
  final EdgeSidecarToChildren? edgeSidecarToChildren;
  final Owner owner;

  const ShortcodeMedia(
    this.content, {
    this.edgeSidecarToChildren,
    required this.owner,
  });

  factory ShortcodeMedia.fromJson(Map<String, dynamic> response) {
    Content content = Content.fromJson(response);
    EdgeSidecarToChildren? edgeSidecarToChildren;
    if (response[ApiUtils.edgeSidecarToChildren] != null) {
      edgeSidecarToChildren = EdgeSidecarToChildren.fromJson(
          response[ApiUtils.edgeSidecarToChildren]);
    }

    final _owner = Owner.fromJson(response[ApiUtils.owner]);

    return ShortcodeMedia(
      content,
      edgeSidecarToChildren: edgeSidecarToChildren,
      owner: _owner,
    );
  }
}
