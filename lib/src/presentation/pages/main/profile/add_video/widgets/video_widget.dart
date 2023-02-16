import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/pages/main/profile/add_video/widgets/video_shimmer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/di/dependency_manager.dart';
import '../../../../../../core/utils/app_helpers.dart';
import '../../../../../../core/utils/local_storage.dart';
import '../../../../../../models/response/video_list_response.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/app_colors.dart';
import '../../../home/shops_loadin_shimmer_footer.dart';
import '../controller/video_service.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key}) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {


  Future<List<Video>> getVideoList()async{
    final video = VideoService(videoRepository);
    final videos = await video.getVideoList();
    final dataVal = VideoListResponse.fromJson(videos);
    print('videos in widget <${dataVal.data}>');
    return dataVal.data;
  }

  @override
  void initState() {
    // TODO: implement initState
    print('Hi from VideoWidget');
    getVideoList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    getVideoList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
          child: Row(
            children: [
              Text('Stories',
                style: GoogleFonts.k2d(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: isDarkMode ? AppColors.white : AppColors.black,
                letterSpacing: -14 * 0.02,
              ),),
              Spacer(),
              ForgotTextButton(
                title: AppHelpers.getTranslation(TrKeys.seeAll),
                fontSize: 12.sp,
                fontColor: isDarkMode ? AppColors.white : AppColors.black,
                onPressed: (){},
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 0),
          margin: EdgeInsets.only(top: 0, bottom: 15),
          child: FutureBuilder<List<Video>>(
            future: getVideoList(),
            builder: (BuildContext context, AsyncSnapshot<List<Video>> snapshot) {
              print('ccccc<<${snapshot.data}>>');
              if (snapshot.hasData) {
                print('zzz<<${snapshot.data}>>');
                final List<Video> videos = snapshot.data as List<Video>;
                return SizedBox(
                  height: 300.r,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: videos.length,
                    physics: const CustomBouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 12),
                            height: 250.r,
                            width: 210.r,
                            child: Chewie(
                              controller: ChewieController(
                                videoPlayerController: VideoPlayerController.network(
                                  'https://api.safin24.uz/storage/images/videos/${videos[index].imageName}',
                                ),
                                autoPlay: true,
                                aspectRatio: 4/5,
                                looping: true,
                                errorBuilder: (_, str){
                                  return Container(
                                    child: Center(
                                      child: Text(str),
                                    ),
                                  );
                                },
                                autoInitialize: true,
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(videos[index].description.toString()),
                        ],
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
              return SizedBox(
                  height: 270.r,
                  child: VideoShimmer(),
              );
            },
          ),
        )
      ],
    );
  }
}
