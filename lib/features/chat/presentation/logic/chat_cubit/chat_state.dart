part of 'chat_cubit.dart';

class ChatCubitState extends Equatable {
  final List<Message> messages;
  const ChatCubitState({required this.messages});
  @override
  List<Object> get props => [messages];
}
