import '../../constants/config.dart';

Map<String, String> createIdProfileImage(String mobile) {
  String dynamicImage = DateTime.now().toIso8601String();

  return {'id': '$ID_IMAGE_PROFILE_TEST${mobile}_$dynamicImage'};
}

String? getIdProfileImage(String? url) {
  if (url == null || url == "") return null;
  List<String> splitUrl = url.split('/');
  for (int i = 0; i < splitUrl.length; i++) {
    if (splitUrl[i].contains(ID_IMAGE_PROFILE_TEST)) return splitUrl[i];
  }
  return null;
}
