part of 'chat_with_openai_cubit.dart';

sealed class ChatWithOpenaiState extends Equatable {
  const ChatWithOpenaiState();

  @override
  List<Object> get props => [];
}

final class ChatWithOpenaiInitial extends ChatWithOpenaiState {}

class SendMessageState extends ChatWithOpenaiState {
  final String message;
  const SendMessageState({required this.message});
}

class RequestMessageState extends ChatWithOpenaiState {
  final String message;
  const RequestMessageState({required this.message});
}

class LoadingRequestMessageState extends ChatWithOpenaiState {}
