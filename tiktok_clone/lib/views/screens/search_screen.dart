import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controllers/search_controller.dart' as search;
import 'package:tiktok_clone/models/user.dart';
import 'package:tiktok_clone/views/screens/profile_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final search.SearchController searchController = Get.put(search.SearchController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: TextFormField(
              decoration: const InputDecoration(
                filled: false,
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontFamily: 'Cera Pro',
                  fontSize: 20,
                ),
              ),
              onChanged: (value) => searchController.searchUser(value),
            ),
          ),
          body: searchController.searchUsers.isEmpty
              ? const Center(
                  child: Text(
                    'Search for Users!',
                    style: TextStyle(
                      fontFamily: 'Cera Pro',
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: searchController.searchUsers.length,
                  itemBuilder: (context, index) {
                    User user = searchController.searchUsers[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(uid: user.uid),
                        ),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.profilePhoto),
                        ),
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            fontFamily: 'Cera Pro',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      }),
    );
  }
}
