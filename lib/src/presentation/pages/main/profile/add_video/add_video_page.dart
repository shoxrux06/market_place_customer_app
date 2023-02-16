import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/pages/main/profile/add_video/riverpod/provider/add_video_provider.dart';
import 'package:video_compress/video_compress.dart';
import 'package:video_player/video_player.dart';
import '../../../../../core/utils/local_storage.dart';
import '../../../../components/buttons/accent_login_button.dart';
import '../../../../theme/app_colors.dart';

class AddVideoPage extends ConsumerStatefulWidget {
  const AddVideoPage({Key? key, required this.videoFile}) : super(key: key);

  final File videoFile;

  @override
  ConsumerState<AddVideoPage> createState() => _AddVideoPageState();
}

class _AddVideoPageState extends ConsumerState<AddVideoPage> {
  ChewieController? _chewieController;

  final descriptionController = TextEditingController();
  MediaInfo? mediaInfo;

  void compressVideo()async{
    mediaInfo = await VideoCompress.compressVideo(
      widget.videoFile.path ?? '',
      quality: VideoQuality.Res640x480Quality,
      deleteOrigin: false, // It's false by default
    );


    int sizeIntBytes = widget.videoFile.lengthSync() ?? 0;
    double sizeInMB = sizeIntBytes / (1024 * 1024);
    print('$sizeInMB Mb');

    int sizeIntBytes2 = mediaInfo?.file?.lengthSync() ?? 0;
    double sizeInMB2 = sizeIntBytes2 / (1024 * 1024);
    print('Compressed --> $sizeInMB2 Mb');
  }

  @override
  void initState() {
    compressVideo();
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.file(
        mediaInfo?.file??File('')
      ),
      autoInitialize: true,
      aspectRatio: 4 / 4,
      autoPlay: true,
      looping: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('****${widget.videoFile.path}****');
    bool isLoading = ref.watch(addVideoProvider).isUploadingVideo;
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child:  SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 24,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400.r,
              child: mediaInfo != null
                  ? Chewie(
                controller: _chewieController!,
              )
                  : const Center(child: Icon(Icons.videocam)),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              width: (MediaQuery.of(context).size.width) - 16,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                onChanged: (value) {},
                style: const TextStyle(fontSize: 18, height: 1.2),
                textInputAction: TextInputAction.done,
                controller: descriptionController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black12),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AccentLoginButton(
                title: 'Add',
                isLoading: isLoading,
                onPressed: () {
                  ref.watch(addVideoProvider.notifier).createVideo(
                      userId: 2.toString(),
                      name: widget.videoFile,
                      description: descriptionController.text
                  ).then((value) {
                    print('Uploaded');
                    Navigator.of(context).pop();
                  });
                  print('added');
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _chewieController?.videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
