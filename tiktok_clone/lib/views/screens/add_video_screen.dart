// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/confirm_screen.dart';

class AddVideoscreen extends StatelessWidget {
  const AddVideoscreen({super.key});

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);

    if (video != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmScreen(
            videoFile: File(video.path),
            videoPath: video.path,
          ),
        ),
      );
    } else {}
  }

  showOtionDialouge(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () => pickVideo(ImageSource.gallery, context),
                  child: const Row(
                    children: [
                      Icon(Icons.image),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            'Gallery',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ))
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => pickVideo(ImageSource.camera, context),
                  child: const Row(
                    children: [
                      Icon(Icons.camera_alt),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            'Camera',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ))
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Row(
                    children: [
                      Icon(Icons.cancel),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            'Cance',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showOtionDialouge(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: const Center(
              child: Text(
                'Add Video',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
