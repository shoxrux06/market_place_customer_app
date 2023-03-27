import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_customer/src/presentation/pages/main/profile/add_video/riverpod/state/add_video_state.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifierr/add_video_notifier.dart';

final addVideoProvider = StateNotifierProvider.autoDispose<AddVideoNotifier, AddVideoState>((ref) =>AddVideoNotifier(videoRepository));