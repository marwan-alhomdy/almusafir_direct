import '../../../helper/public_infromation.dart';
import '../../data/current_user/current_user.dart';

void setAuth(CurrentUser user) {
  Helper.primaryData?.data?.currentUser = user;
}
