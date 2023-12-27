class VideoModel {
  final videoId;
  final String title;
  final String description;
  final String thumbnailUrl;
  VideoModel({
    required this.videoId,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
  });
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    //   print("hereeeee 1 ${json['snippet']}");
    final thumbnails = json['thumbnails'];
    // Check if 'thumbnails' field exists in the API response
    final defaultThumbnail = thumbnails != null ? thumbnails['high'] : null;
    return VideoModel(
      videoId: json['resourceId']['videoId'],
      title: json['title'],
      description: json['description'],
      thumbnailUrl: defaultThumbnail != null ? defaultThumbnail['url'] : '',
    );
  }
}
