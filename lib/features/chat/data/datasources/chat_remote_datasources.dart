import 'package:almusafir_direct/core/server/header_server.dart';

import '../../../../core/constants/endpoint.dart';
import '../../../../core/services/api.service.dart';

abstract class ChatRemoteDataSource {
  Future<String> chatWithOpenai(String userMessage);
}

class ChatRemoteDataSourceeImplWithDio extends ChatRemoteDataSource {
  final ApiService apiService;
  ChatRemoteDataSourceeImplWithDio({required this.apiService});

  @override
  Future<String> chatWithOpenai(String userMessage) async {
    final response = await apiService.get(
      baseUrl: "https://api.openai.com/v1/",
      endPoint: EndPointName.chatWithGPT,
      headers: HeaderServer.headerWithOpenAIToken,
      data: {
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": userMessage}
        ]
      },
    );

    return response['choices'][0]['message']['content'];
  }
}
