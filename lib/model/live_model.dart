class YoutubeSearchListResponse {
  String kind;
  String etag;
  String regionCode;
  PageInfo pageInfo;
  List<YoutubeSearchResult> items;
  YoutubeSearchListResponse({
    required this.kind,
    required this.etag,
    required this.regionCode,
    required this.pageInfo,
    required this.items,
  });
  factory YoutubeSearchListResponse.fromJson(Map<String, dynamic> json) {
    return YoutubeSearchListResponse(
      kind: json['kind'],
      etag: json['etag'],
      regionCode: json['regionCode'],
      pageInfo: PageInfo.fromJson(json['pageInfo']),
      items: List<YoutubeSearchResult>.from(
        json['items'].map((item) => YoutubeSearchResult.fromJson(item)),
      ),
    );
  }
}

class PageInfo {
  int totalResults;
  int resultsPerPage;
  PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });
  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      totalResults: json['totalResults'],
      resultsPerPage: json['resultsPerPage'],
    );
  }
}

class YoutubeSearchResult {
  String kind;
  String etag;
  YoutubeVideoId id;
  YoutubeSearchResult({
    required this.kind,
    required this.etag,
    required this.id,
  });
  factory YoutubeSearchResult.fromJson(Map<String, dynamic> json) {
    return YoutubeSearchResult(
      kind: json['kind'],
      etag: json['etag'],
      id: YoutubeVideoId.fromJson(json['id']),
    );
  }
}

class YoutubeVideoId {
  String kind;
  String videoId;
  YoutubeVideoId({
    required this.kind,
    required this.videoId,
  });
  factory YoutubeVideoId.fromJson(Map<String, dynamic> json) {
    return YoutubeVideoId(
      kind: json['kind'],
      videoId: json['videoId'],
    );
  }
}

/////////////////////////////// second model /////////////
class YoutubeSearchListResponse2 {
  final String kind;
  final String etag;
  final String nextPageToken;
  final String regionCode;
  final PageInfo pageInfo;
  final List<YoutubeVideo> items;
  YoutubeSearchListResponse2({
    required this.kind,
    required this.etag,
    required this.nextPageToken,
    required this.regionCode,
    required this.pageInfo,
    required this.items,
  });
  factory YoutubeSearchListResponse2.fromJson(Map<String, dynamic> json) {
    final List<dynamic> itemsList = json['items'];
    final List<YoutubeVideo> videoItems =
        itemsList.map((item) => YoutubeVideo.fromJson(item)).toList();
    return YoutubeSearchListResponse2(
      kind: json['kind'],
      etag: json['etag'],
      nextPageToken: json['nextPageToken'],
      regionCode: json['regionCode'],
      pageInfo: PageInfo.fromJson(json['pageInfo']),
      items: videoItems,
    );
  }
}

class PageInfo2 {
  final int totalResults;
  final int resultsPerPage;
  PageInfo2({
    required this.totalResults,
    required this.resultsPerPage,
  });
  factory PageInfo2.fromJson(Map<String, dynamic> json) {
    return PageInfo2(
      totalResults: json['totalResults'],
      resultsPerPage: json['resultsPerPage'],
    );
  }
}

class YoutubeVideo {
  final String kind;
  final String etag;
  final String videoId;
  final String publishedAt;
  final String channelId;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String channelTitle;
  final String liveBroadcastContent;
  final String publishTime;
  YoutubeVideo({
    required this.kind,
    required this.etag,
    required this.videoId,
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.channelTitle,
    required this.liveBroadcastContent,
    required this.publishTime,
  });
  factory YoutubeVideo.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'] ?? '';
    final thumbnails = snippet['thumbnails'] ?? '';
    return YoutubeVideo(
      kind: json['kind'] ?? ' ',
      etag: json['etag'] ?? '',
      videoId: json['id']['videoId'] ?? '',
      publishedAt: snippet['publishedAt'] ?? '',
      channelId: snippet['channelId'] ?? '',
      title: snippet['title'] ?? '',
      description: snippet['description'] ?? '',
      thumbnailUrl: thumbnails['default']['url'] ?? '',
      channelTitle: snippet['channelTitle'] ?? '',
      liveBroadcastContent: snippet['liveBroadcastContent'] ?? '',
      publishTime: snippet['publishTime'] ?? '',
    );
  }
}
