import '../../core/constants/constants.dart';

class ChatMessageData {
  final MessageOwner messageOwner;
  final String message;
  final String time;
  final DateTime date;

  ChatMessageData({
    required this.messageOwner,
    required this.message,
    required this.time,
    required this.date
  });
}
