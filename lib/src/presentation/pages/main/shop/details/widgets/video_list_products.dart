import 'package:g_customer/src/presentation/pages/main/profile/add_video/riverpod/provider/add_video_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:chewie/chewie.dart';
import '../../../../../../models/response/video_list_response.dart';
import '../../../../../components/components.dart';

class VideoListProducts extends ConsumerStatefulWidget {
  const VideoListProducts({Key? key}) : super(key: key);

  @override
  ConsumerState<VideoListProducts> createState() => _VideoListProductsState();
}

class _VideoListProductsState extends ConsumerState<VideoListProducts> {

  @override
  void initState() {
    super.initState();
  }

  List<Video> videoList = [];

  Future<List<Video>> getVideoList() async {
    videoList = await ref.read(addVideoProvider.notifier).getVideoList();
    print(' Hi *** $videoList ***');
    return videoList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: getVideoList(),
      builder: (BuildContext context, AsyncSnapshot<List<Video>> snapshot) {
        print('Video<<${snapshot.data}>>');
        if (snapshot.hasData) {
          print('Video<<${snapshot.data}>>');
          final List<Video> videos = snapshot.data as List<Video>;
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: videos.length,
              physics: const CustomBouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: 150,
                  child: Chewie(
                    controller: ChewieController(
                      videoPlayerController: VideoPlayerController.network(
                        'https://api.safin24.uz/storage/images/videos/${videos[index].imageName}',
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        if(snapshot.hasError){
          print('Error get Video');
        }
        if(!snapshot.hasData){
          print('Data is empty');
        }
        return Container(
          width: 1.sw,
          height: 24,
          color: Colors.amber,
        );
      },
    );
  }
}
