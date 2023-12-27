import 'dart:convert';

import 'package:com.sports.channel/model/playlist_model.dart';
import 'package:com.sports.channel/model/video_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  String apiKey = "AIzaSyBJ22TFOssy8XPr0zkIems30Uh6OTh-Ehg";
  String channelId = 'UCnDqy4eA9Vr5g6Vy30d3N8w';

  String playListVideosNextPageToken = '';

  Future<List<PlaylistModel>?> fetchAllPlaylists() async {
    String? playListNextPageToken = "";
    List<PlaylistModel> allPlaylists = [];
    try {
      //    String? nextPageToken = null; // Initialize nextPageToken as null
 //'https://www.googleapis.com/youtube/v3/channels?part=statistics&id=$channelId&key=$apiKey',
      //),
      do {
        print("playlist nextpage token:: $playListNextPageToken");
        final url = Uri.parse(
          'https://www.googleapis.com/youtube/v3/playlists'
          '?part=snippet'
          '&statistics&id'
          '&channelId=$channelId'
          //'&maxResults=50' // Increase maxResults to get more playlists per request
          '${playListNextPageToken != null ? '&pageToken=$playListNextPageToken' : ''}' // Only include pageToken if not null
          '&key=$apiKey',
        );

        final response = await http.get(url);

//  if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         views = int.parse(data['items'][0]['statistics']['viewCount']);
//       });
//     } else {
//       throw Exception('Failed to load channel views');
//     }
//   }

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          final newPlaylists = (data['items'] as List)
              .map((json) => PlaylistModel.fromJson(json))
              .toList();
          allPlaylists.addAll(newPlaylists);

          playListNextPageToken = data['nextPageToken'];
        } else {
          print("Error Occurred ${response.body}");
          playListNextPageToken = null;
          //  return null;
        }
      } while (playListNextPageToken != null);
    } catch (e) {
      print("Error Occurred: $e");
      // return null;
    }
    return allPlaylists;
  }

  Future<List<VideoModel>?> fetchVideosInPlaylist(playlistId) async {
    String? playListVideosNextPageToken = "";
    List<VideoModel> playlistAllVideos = [];
    do {
      final url = Uri.parse(
        'https://www.googleapis.com/youtube/v3/playlistItems'
        '?part=snippet'
        // '&maxResults=10'
        '&playlistId=$playlistId'
        '&pageToken=$playListVideosNextPageToken'
        '&key=$apiKey',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Extract the 'nextPageToken' for pagination
        playListVideosNextPageToken = jsonResponse['nextPageToken'];
        final videos = (jsonResponse['items'] as List)
            .map((json) => VideoModel.fromJson(json['snippet']))
            .toList();
        playlistAllVideos.addAll(videos);
        // return videos;
      } else {
        print("Eroor Occured ${response.body}");
        playListVideosNextPageToken = null;
        //return null;
        //     throw Exception('Failed to load videos in playlist');
      }
    } while (playListVideosNextPageToken != null);

    return playlistAllVideos;
  }
}
