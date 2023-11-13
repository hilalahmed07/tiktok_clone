import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controllers/upload_video_controller.dart';
import 'package:tiktok_clone/views/widgets/text_inputfield.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen({
    super.key,
    required this.videoFile,
    required this.videoPath,
  });

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  final TextEditingController _songController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();

  UploadVideoController uploadvideoController = Get.put(
    UploadVideoController(),
  );

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    _songController.dispose();
    _captionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            child: VideoPlayer(controller),
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _songController,
                    labelText: 'song Name',
                    icon: Icons.music_note,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _captionController,
                    labelText: 'Caption',
                    icon: Icons.closed_caption,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => uploadvideoController.uploadVideo(_songController.text, _captionController.text, widget.videoPath),
                  child: const Text(
                    'Share!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
