import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/utils/app_helpers.dart';
import '../../../../../../riverpod/provider/app_provider.dart';
import '../add_video_page.dart';
import '../riverpod/provider/add_video_provider.dart';
import 'language_modal.dart';

class SourceButton extends ConsumerStatefulWidget {
  const SourceButton({Key? key}) : super(key: key);

  @override
  ConsumerState<SourceButton> createState() => _SourceButtonState();
}

class _SourceButtonState extends ConsumerState<SourceButton> {
  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(appProvider);
    final state = ref.watch(addVideoProvider);
    print('Source ->> ::: ${state.isCompressingVideo}::::');
    return InkWell(
        onTap: () {
          AppHelpers.showCustomModalBottomSheet(
            context: context,
            modal: LanguageModal(),
            isDarkMode: appState.isDarkMode,
          );
        },
        child:const Icon(Icons.video_settings,)
    );
  }
}

