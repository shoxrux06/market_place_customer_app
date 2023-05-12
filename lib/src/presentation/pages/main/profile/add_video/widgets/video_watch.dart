import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../core/constants/app_constants.dart';

class VideoWatchScreen extends StatefulWidget {
  final String imageName;

  const VideoWatchScreen({Key? key, required this.imageName}) : super(key: key);

  @override
  State<VideoWatchScreen> createState() => _VideoWatchScreenState();
}

class _VideoWatchScreenState extends State<VideoWatchScreen> {
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(
      '${AppConstants.baseUrl}/storage/images/videos/${widget.imageName}',
    );

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      showControlsOnInitialize: false,
      showControls: false,
      showOptions: false,
      fullScreenByDefault: false,
      autoInitialize: true,
      looping: false,
      autoPlay: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );

    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        print('video Ended');
        dispose();
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    print('ImageName --> ${widget.imageName}');
    return Scaffold(
      body: SizedBox(
          width: mediaQuery.width,
          height: mediaQuery.height,
          child: Chewie(
            controller:_chewieController,
          )),
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }
}
