import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../data/models/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  ChatCubit() : super(const ChatCubitState(messages: []));

  final ScrollController scrollController = ScrollController();
  final StreamController<List<Message>> streamController =
      StreamController.broadcast();

  Stream<List<Message>> get messagesStream => streamController.stream;

  @override
  Future<void> close() {
    scrollController.dispose();

    streamController.close();
    return super.close();
  }

  List<Message> messages = [];

  void sendMessage(Message message) {
    streamController.add([...messages, message]);
    messages.add(message);
    scrollToBottom();
  }

  void addMessage(Message message) {
    messages.add(message);
    scrollToBottom();
  }

  void addAllMessage(List<Message> messages) {
    this.messages = messages;
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + Get.height,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
