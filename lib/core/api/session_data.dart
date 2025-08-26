import 'package:archtech/features/Home/data/models/ruins_model.dart';
import 'package:archtech/features/Subscriptions/data/subscriptions_model.dart';
import 'package:archtech/features/_auth/model/user_model.dart';

final class SessionData {
  SessionData._();
  static UserModel? userModel;
  static bool? isTourist;
  static List<Ruin> ruins = [];
  static SubscriptionsModel? subscriptionsModel;
}
