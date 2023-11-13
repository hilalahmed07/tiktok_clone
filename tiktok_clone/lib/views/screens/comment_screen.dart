import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controllers/comment_controller.dart';
import 'package:timeago/timeago.dart' as tago;

// ignore: must_be_immutable
class CommentScreen extends StatelessWidget {
  final String id;
  CommentScreen({
    super.key,
    required this.id,
  });

  final TextEditingController _commentController = TextEditingController();
  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(id);
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                    itemCount: commentController.comments.length,
                    itemBuilder: (context, index) {
                      final comment = commentController.comments[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage(comment.profilePhoto),
                        ),
                        title: Row(
                          children: [
                            Text(
                              comment.username,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '  ${comment.comment}',
                              style: const TextStyle(
                                fontFamily: 'Cera Pro',
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              tago.format(comment.datePublished.toDate()),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${comment.likes.length} likes',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () => commentController.likeComment(comment.id),
                          child: Icon(
                            Icons.favorite,
                            color: comment.likes.contains(authController.user.uid) ? Colors.red : Colors.white,
                            size: 17,
                          ),
                        ),
                      );
                    });
              }),
            ),
            const Divider(),
            ListTile(
              title: TextFormField(
                controller: _commentController,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  labelText: 'comment',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              trailing: TextButton(
                onPressed: () => commentController.postComment(_commentController.text),
                child: const Text(
                  'send',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
