import 'package:com.sports.channel/model/video_model.dart';

class PlaylistModel {
  final String playlistId;
  final String name;
  final String description;
  String thumbnailUrl; // Change from 'final' to 'String'
  String thumbnailQuality;
  List<VideoModel> playListVideo = []; // Add this field
  PlaylistModel({
    required this.playlistId,
    required this.name,
    required this.description,
    required this.thumbnailUrl,
    required this.thumbnailQuality,
  });
  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'];
    final thumbnails = snippet['thumbnails'];
    // Choose the desired thumbnail quality (e.g., 'medium' or 'high')
    const thumbnailQuality = 'high';
    final thumbnailUrl = thumbnails[thumbnailQuality]['url'];
    return PlaylistModel(
      playlistId: json['id'],
      name: snippet['title'],
      description: snippet['description'],
      thumbnailUrl: thumbnailUrl,
      thumbnailQuality: thumbnailQuality,
    );
  }
}
