import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/appbar/my_appbar.dart';
import '../cubit/chat_cubit.dart';
import '../widgets/chat_widget.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: Scaffold(
        appBar: const MyAppBarWithLogo(),
        body: ChatWidget(),
      ),
    );
  }
}
