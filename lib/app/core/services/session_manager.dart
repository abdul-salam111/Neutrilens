
import '../data/local_data/secure_storage/storage.dart';



class SessionController {
//  GetLoginResponse getUserDetails = GetLoginResponse();

  static final SessionController _session = SessionController._internal();
  bool islogin = false;
  String? userId;
  SessionController._internal();

  static SessionController get instance => _session;

  factory SessionController() {
    return _session;
  }

// get user details as a param and save in shared pref
  Future<void> saveUserInStorage() async {
    // await storage.setValues(StorageKeys.userDetails, jsonEncode(user));
    // await storage.setValues(StorageKeys.loggedIn, 'true');
    //  await storage.setValues(
    //     StorageKeys.userId,
    //     user.customer!.customerId!.toString(),
    //   );
    //   await storage.setValues(
    //     StorageKeys.token,
    //     user.authToken!.accessToken!,
    //   );
  }

  Future<void> getUserfromSharedpref() async {
    try {
      final userData = await storage.readValues(StorageKeys.userDetails);
      if (userData != null) {
        // SessionController().getUserDetails = GetLoginResponse.fromJson(
        //   jsonDecode(userData),
        // );
      }
      final isLoggedIn = await storage.readValues(StorageKeys.loggedIn);
      SessionController().islogin = (isLoggedIn == 'true' ? true : false);
    } catch (e) {
      throw Exception(e);
    }
  }
}
