import 'package:com.sports.channel/core/services/api_services.dart';
import 'package:com.sports.channel/model/playlist_model.dart';
import 'package:com.sports.channel/model/video_model.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  final ApiServices _apiServices = ApiServices();
  final playlistScrollController = ScrollController();
  // final playlistScrollController2 = ScrollController();
  bool isLoadingPlaylist = true;
  bool playListFetchingComplete = false;
  List<PlaylistModel> playlists = [];

  List<PlaylistModel> playlists2 = [];
  bool isLoading = false;
  int? index;
  String title = '';
  String description = '';
  String playListName = '';

  String currentvideo = '';
  String CurrentPlayListId = '';
  int screens = 0;
  int clubeScreen = 0;
  HomeScreenProvider() {
    init();
  }

  init() async {
    isLoading = true;

    await fetchPlayList();
    notifyListeners();
    //initScrollController();
    // initScrollController2();
    // await fetchPlayList2();
    isLoading = false;
    //initScrollControllerVid();
    // resetToken(); // Reset token before fetching videos
    //await fetchVideosForAllPlaylists(); // Fetch videos for all playlists
    notifyListeners();
  }

  initScrollController() {
    playlistScrollController.addListener(_scrollListener);
  }

  // initScrollController2() {
  //   playlistScrollController2.addListener(_scrollListener2);
  // }

  void _scrollListener() async {
    if (playlistScrollController.offset >=
            playlistScrollController.position.maxScrollExtent &&
        !playlistScrollController.position.outOfRange) {
      print("comes to bottom $isLoadingPlaylist");
      if (isLoadingPlaylist && !playListFetchingComplete) {
        isLoadingPlaylist = false;
        fetchPlayList();
        isLoadingPlaylist = true;
      }
    }
  }

  // void _scrollListener2() async {
  //   if (playlistScrollController2.offset >=
  //           playlistScrollController2.position.maxScrollExtent &&
  //       !playlistScrollController2.position.outOfRange) {
  //     print("comes to bottom $isLoadingPlaylist");
  //     if (isLoadingPlaylist && !playListFetchingComplete) {
  //       isLoadingPlaylist = false;
  //       fetchPlayList2();
  //       isLoadingPlaylist = true;
  //     }
  //   }
  // }

  Future fetchPlayList() async {
    try {
      final playList = await _apiServices.fetchAllPlaylists();
      if (playList != null) {
        playlists.addAll(playList);
        await fetchVideosForAllPlaylists();
      } else {
        playListFetchingComplete = true;
      }
    } catch (e) {
      print("error occured:: $e");
      playListFetchingComplete = true;
    }
    notifyListeners();
  }

  // Future fetchPlayList2() async {
  //   try {
  //     final playList2 = await _apiServices.fetchAllPlaylists();
  //     if (playList2 != null) {
  //       playlists2.addAll(playList2);
  //     } else {
  //       playListFetchingComplete = true;
  //     }
  //   } catch (e) {
  //     print("error occured:: $e");
  //     playListFetchingComplete = true;
  //   }
  //   notifyListeners();
  // }

  toogleScreen(int a) {
    screens = a;
    notifyListeners();
  }

  ClubetoogleScreen(int a) {
    clubeScreen = a;
    notifyListeners();
  }

  final videoListScrollController = ScrollController();
  //List<VideoModel> allVideos = [];
  bool isLoadingPlaylistVideo = true;

  initScrollControllerVid() {
    videoListScrollController.addListener(_scrollListenerVid);
  }

  void _scrollListenerVid() async {
    if (videoListScrollController.offset >=
            videoListScrollController.position.maxScrollExtent &&
        !videoListScrollController.position.outOfRange) {
      print("comes to bottom $isLoading");
      if (isLoadingPlaylistVideo && !playListFetchingComplete) {
        isLoadingPlaylistVideo = false;
        fetchPlayListVideo2();
        isLoadingPlaylistVideo = true;
      }
    }
  }

  resetToken() {
    //  allVideos = [];
    // _apiServices.playListVideosNextPageToken = '';
    playListFetchingComplete = false;
  }

  List<bool> boolList = [];
  String playListId = "";
  bool isLoader = false;

  // Fetch videos for a single playlist
  Future<void> fetchVideosForPlaylist(PlaylistModel playlist) async {
    print("fethch videos cslled");
    try {
      final playListVideo =
          await _apiServices.fetchVideosInPlaylist(playlist.playlistId);
      if (playListVideo != null) {
        //   allVideos.addAll(playListVideo);
        playlist.playListVideo.addAll(playListVideo);
      } else {
        playListFetchingComplete = true;
      }
    } catch (e) {
      print("error occurred: $e");
      playListFetchingComplete = true;
    }
    notifyListeners();
  }

  List<VideoModel> allVideos = [];
  Future fetchPlayListVideo(String playListId) async {
    print("fetchplayList video calling");
    isLoader = true;
    allVideos = [];
    print("the play list id $playListId");
    try {
      final playListVideo =
          await _apiServices.fetchVideosInPlaylist(playListId);
      if (playListVideo != null) {
        allVideos.addAll(playListVideo);
        notifyListeners();
        print("play list dataaa:: ${allVideos.length}");
      } else {
        playListFetchingComplete = true;
      }
    } catch (e) {
      print("error occured:: $e");
      playListFetchingComplete = true;
    }
    isLoader = false;
    notifyListeners();
  }

  resetTokens() {
    allVideos = [];
    _apiServices.playListVideosNextPageToken = '';
    playListFetchingComplete = false;
  }

  // Fetch videos for all playlists
  Future<void> fetchVideosForAllPlaylists() async {
    print("playlist length: ${playlists.length}");
    for (var playlist in playlists) {
      print("playlist id: ${playlist.name}");
      await fetchVideosForPlaylist(playlist);
    }
  }

  Future fetchPlayListVideo2() async {
    // print(" ========>>>>>> aall videoss ${allVideos.length}");
    isLoader = true;
    print("the play list id $playListId");
    try {
      final playListVideo =
          await _apiServices.fetchVideosInPlaylist(playListId);
      if (playListVideo != null) {
        //    allVideos.addAll(playListVideo);
        //  boolList = List<bool>.generate(allVideos.length, (index) => false);
        boolList[0] = true;
        print("bool is $boolList");
        notifyListeners();
      } else {
        playListFetchingComplete = true;
      }
    } catch (e) {
      print("error occured:: $e");
      playListFetchingComplete = true;
    }
    isLoader = false;
    notifyListeners();
  }
}
