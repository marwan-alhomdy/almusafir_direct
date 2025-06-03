import '../../../features/home/data/model/current_user/current_user.dart';
import '../../../helper/public_infromation.dart';

void setAuth(CurrentUser user) {
  Helper.dataApp?.data?.currentUser = user;
}
