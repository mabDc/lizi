// import 'package:flutter/material.dart';
// import 'package:chewie/chewie.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayPage extends StatefulWidget {
//   VideoPlayPage();
//   @override
//   VideoPlayPageState createState() => VideoPlayPageState();
// }

// class VideoPlayPageState extends State<VideoPlayPage> {
//   @override
//   Widget build(BuildContext context) {
//     final videoPlayerController = VideoPlayerController.network(
//         'https://www.runoob.com/try/demo_source/movie.mp4');

//     final chewieController = ChewieController(
//       videoPlayerController: videoPlayerController,
//       aspectRatio: 3 / 2,
//       autoPlay: true,
//       looping: true,
//     );
//     return Scaffold(
//       appBar: AppBar(title: Text('data'),),
//       body: Chewie(
//         controller: chewieController,
//       ),
//     );
//   }
// }
