// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:music_player/di.dart';

class BotApi {
  static Future<Response> getMe() async {
    return locator<Dio>().get('getMe');
  }

  static Future<Response> sendMessage({
    required int chatId,
    required String text,
  }) async {
    return locator<Dio>().post(
      'sendMessage',
      data: {
        'chat_id': chatId,
        'text': text,
      },
    );
  }

  static Future<Response> sendAudio({
    required int chatId,
    required String? audio,
    required String? caption,
  }) async {
    if (audio == null || caption == null) {
      throw Exception('Audio and caption must not be null');
    }
    try{
      print('sendAudio');
      print(locator<Dio>().options.baseUrl);

      FormData formData = FormData.fromMap({
        'chat_id': chatId,
        'audio': await MultipartFile.fromFile(audio),
        'caption': caption,
      });
    return locator<Dio>().post(
      'sendAudio',
      data: formData,
    );

    } catch(e){
      print(e);
    }

    return Response(requestOptions: RequestOptions(path: ''));
  }

  static Future<Response> getAudio({
    required String fileId,
  }) async {
    return locator<Dio>().post(
      'getFile',
      data: {
        'file_id': fileId,
      },
    );
  }
}
