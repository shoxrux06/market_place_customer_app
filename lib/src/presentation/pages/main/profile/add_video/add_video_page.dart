import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/core/constants/constants.dart';
import 'package:g_customer/src/core/utils/app_helpers.dart';
import 'package:g_customer/src/presentation/pages/main/profile/add_address/riverpod/provider/add_address_provider.dart';
import 'package:g_customer/src/presentation/pages/main/profile/add_video/riverpod/provider/add_video_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import '../../../../../core/utils/local_storage.dart';
import '../../../../components/buttons/accent_login_button.dart';
import '../../../../components/components.dart';
import '../../../../theme/app_colors.dart';

class AddVideoPage extends ConsumerStatefulWidget {
  const AddVideoPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AddVideoPage> createState() => _AddVideoPageState();
}

class _AddVideoPageState extends ConsumerState<AddVideoPage> {
  final descriptionController = TextEditingController();

  ChewieController? _chewieController;
  late VideoPlayerController videoController;
  File? videoFile;
  File? selectedFile;

  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      final state = ref.watch(addVideoProvider);
      videoFile = state.videoFile;
      print('videoFile in add page $videoFile}');
      videoController = VideoPlayerController.file(videoFile ?? File(''))..initialize().then((value) => setState((){}));
      _chewieController = ChewieController(
        videoPlayerController: videoController,
        autoInitialize: true,
        aspectRatio: 4 / 4,
        autoPlay: true,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = ref.watch(addVideoProvider).isUploadingVideo;
    final bool isLtr = LocalStorage.instance.getLangLtr();
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();

    return Directionality(
        textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
        child: KeyboardDismisser(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
              title: Text(
                AppHelpers.getTranslation(TrKeys.addVideo),
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: context.popRoute,
                icon: Icon(
                  FlutterRemix.arrow_left_s_line,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
                splashRadius: 20.r,
                padding: EdgeInsets.zero,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black38,
                              width: 1
                          ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    width: MediaQuery.of(context).size.width,
                    height: 400.r,
                    child:  ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Chewie(
                              controller: _chewieController??ChewieController(videoPlayerController: VideoPlayerController.network('')),
                            ),
                    )
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.all(16),
                      width: 140,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black38,
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                          child: selectedFile?.path.isNotEmpty??false?ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.file(selectedFile??File(''),  width: 140, height: 150,fit: BoxFit.fill,)):
                          TextButton(onPressed: ()async{
                            XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
                            setState(() {
                              selectedFile = File(imageFile?.path ?? '');
                            });
                            }, child: Text(AppHelpers.getTranslation(TrKeys.selectBanner), style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                          ),
                          ),
                      ),
                    ),
                  ),
                  const SizedBox(
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
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black38,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        labelText: AppHelpers.getTranslation(TrKeys.description),
                        labelStyle: const TextStyle(
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
                      title: AppHelpers.getTranslation(TrKeys.add),
                      isLoading: isLoading,
                      onPressed: () {
                        ref.watch(addVideoProvider.notifier)
                            .createVideo(
                                userId: 2,
                                imageFile: selectedFile??File(''),
                                description: descriptionController.text,
                        )
                            .then((value) {
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
          ),
        ));
  }


  @override
  void dispose() {
    _chewieController?.dispose();
    videoController.dispose();
    print('Disposed _____________>>>>>>>>>>>>');
    super.dispose();
  }
}
