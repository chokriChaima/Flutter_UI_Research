import 'package:flutter/material.dart';
import 'package:tester_app/views/custom_widgets/side_bar.dart';
import 'package:tester_app/views/custom_widgets/animations.dart';
import 'package:video_player/video_player.dart';

class VideoOfWeek extends StatefulWidget {
  const VideoOfWeek({Key? key}) : super(key: key);

  @override
  State<VideoOfWeek> createState() => _VideoOfWeekState();
}

class _VideoOfWeekState extends State<VideoOfWeek>  {
 

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text("Video of the week"),
        centerTitle: true,
      ),
      body:const 
      InitializeVideoPlayer()
        
      );
    
  }
}

class InitializeVideoPlayer extends StatefulWidget {
  const InitializeVideoPlayer({Key? key}) : super(key: key);

  @override
  State<InitializeVideoPlayer> createState() => _InitializeVideoPlayerState();
}

class _InitializeVideoPlayerState extends State<InitializeVideoPlayer> {
  late VideoPlayerController _controller;
  String asset = "assets/video.mp4";
  @override
  void initState() {
    super.initState();
     _controller = VideoPlayerController.asset(
        asset)
      ..addListener(() => setState(() {
        
      }))..initialize().then((v_) => _controller.play());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const Text("not initialized"),
        );
    
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
    
}
