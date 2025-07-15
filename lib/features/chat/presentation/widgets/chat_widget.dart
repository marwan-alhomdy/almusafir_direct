import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/message.dart';
import '../logic/chat_cubit/chat_cubit.dart';
import '../logic/chat_with_openai_cubit/chat_with_openai_cubit.dart';
import 'chat_message_card.dart';
import 'footer/footer_chat.widget.dart';
import 'state/empty_chat_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final chatCubit = context.read<ChatCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      chatCubit.scrollToBottom();
    });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Message>>(
              stream: chatCubit.messagesStream,
              builder: (context, snapshot) {
                if (chatCubit.messages.isEmpty) {
                  return const EmptyChatWidget();
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    controller: chatCubit.scrollController,
                    itemCount: chatCubit.messages.length,
                    itemBuilder: (context, index) {
                      final message = chatCubit.messages[index];
                      return ChatMessageCard(message: message);
                    },
                  );
                }
              },
            ),
          ),
          BlocBuilder<ChatWithOpenaiCubit, ChatWithOpenaiState>(
              builder: (context, state) => (state is LoadingRequestMessageState)
                  ? ChatMessageCard(
                      isLoading: true,
                      message: Message(direction: "OUT"),
                    )
                  : const SizedBox()),
          const FooterChatWidget(),
        ],
      ),
    );
  }
}
