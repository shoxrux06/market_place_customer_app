import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../state/chat_state.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  ChatNotifier() : super(ChatState(textController: TextEditingController()));

  Future<void> fetchChats(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final userId = LocalStorage.instance.getUser()?.user?.id;
    QuerySnapshot? query;
    try {
      query = await _fireStore
          .collection('chats')
          .where('user.id', isEqualTo: userId)
          .get();
    } catch (e) {
      state = state.copyWith(isLoading: false);
      AppHelpers.showCheckFlash(
        context,
        AppHelpers.getTranslation(TrKeys.errorWithConnectingToFirebase),
      );
    }
    if (query?.size == 0) {
      final CollectionReference chats = _fireStore.collection('chats');
      chats.doc().set(
        {
          "shop_id": -1,
          "created_at": Timestamp.now(),
          "user": {
            "firstname": LocalStorage.instance.getUser()?.user?.firstname,
            "id": LocalStorage.instance.getUser()?.user?.id,
            "img": LocalStorage.instance.getUser()?.user?.img,
            "lastname": LocalStorage.instance.getUser()?.user?.lastname,
          }
        },
      );
      final String chatId = chats.id;
      state = state.copyWith(chatId: chatId, isLoading: false);
    } else {
      final String? chatId = query?.docs.first.id;
      state = state.copyWith(chatId: chatId ?? '', isLoading: false);
    }
  }

  Future<void> sendMessage() async {
    try {
      CollectionReference message = _fireStore.collection('messages');
      message.add(
        {
          'chat_content': state.textController?.text,
          "chat_id": state.chatId,
          "created_at": Timestamp.now(),
          "sender": 1,
          'unread': true,
        },
      );
      state.textController?.clear();
    } catch (e) {
      debugPrint('==> send message $e');
    }
  }

  void checkAuthorised(BuildContext context) {
    if (LocalStorage.instance.getUser() == null) {
      LocalStorage.instance.deleteToken();
      AppHelpers.showCheckFlash(
        context,
        AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
      );
      context.router.pushAndPopUntil(
        const LoginRoute(),
        predicate: (route) => false,
      );
    } else {
      context.router.popAndPush(const ChatRoute());
    }
  }
}
