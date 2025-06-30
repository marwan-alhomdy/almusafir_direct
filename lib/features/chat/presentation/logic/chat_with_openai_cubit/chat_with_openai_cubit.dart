import 'package:almusafir_direct/features/chat/domain/usecases/chat_with_openai.usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_with_openai_state.dart';

class ChatWithOpenaiCubit extends Cubit<ChatWithOpenaiState> {
  final ChatWithOpenaiDataUsecases chatWithOpenaiDataUsecases;
  ChatWithOpenaiCubit({
    required this.chatWithOpenaiDataUsecases,
  }) : super(ChatWithOpenaiInitial());
  final textController = TextEditingController();

  @override
  Future<void> close() {
    textController.dispose();
    return super.close();
  }

  void chatWithOpenai() async {
    if (textController.text.trim().isEmpty) return;

    final message = textController.text;
    textController.text = "";
    emit(SendMessageState(message: message));

    emit(LoadingRequestMessageState());
    final failureOrSuccess = await chatWithOpenaiDataUsecases(message);

    failureOrSuccess.fold(
        (failuer) => emit(RequestMessageState(message: failuer.message)),
        (message) => emit(RequestMessageState(message: message)));
  }
}
