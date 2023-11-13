import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/user.dart';

class SearchController extends GetxController {
  final Rx<List<User>> _searchUsers = Rx<List<User>>([]);

  List<User> get searchUsers => _searchUsers.value;

  searchUser(String typedUser) async {
    _searchUsers.bindStream(
      firestore.collection('users').where('name', isGreaterThanOrEqualTo: typedUser).snapshots().map(
        (QuerySnapshot query) {
          List<User> retVal = [];
          for (var elem in query.docs) {
            retVal.add(User.fromSnap(elem));
          }
          return retVal;
        },
      ),
    );
  }
}
