import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart' as di;
import '../../../../core/widget/appbar/my_appbar.dart';
import '../../data/models/message.dart';
import '../logic/chat_cubit/chat_cubit.dart';
import '../logic/chat_with_openai_cubit/chat_with_openai_cubit.dart';
import '../widgets/chat_widget.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<ChatWithOpenaiCubit>()),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: const MyAppBarWithLogo(),
          body: BlocListener<ChatWithOpenaiCubit, ChatWithOpenaiState>(
            listener: _listenerChatWithOpenai,
            child: const ChatWidget(),
          ),
        );
      }),
    );
  }

  void _listenerChatWithOpenai(
      BuildContext context, ChatWithOpenaiState state) {
    if (state is SendMessageState) {
      sendOrRequestmessage(context, state.message, "IN");
    } else if (state is RequestMessageState) {
      sendOrRequestmessage(context, state.message, "OUT");
    } else if (state is LoadingRequestMessageState) {}
  }

  void sendOrRequestmessage(
      BuildContext context, String message, String direction) {
    final controller = context.read<ChatCubit>();
    controller.sendMessage(
      Message(
        seen: false,
        createdAt: DateTime.now(),
        content: message.trim(),
        direction: direction,
        threadName: "",
      ),
    );
  }
}
