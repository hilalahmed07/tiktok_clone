import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/controllers/auth_controller.dart';
import 'package:tiktok_clone/views/screens/add_video_screen.dart';
import 'package:tiktok_clone/views/screens/profile_screen.dart';
import 'package:tiktok_clone/views/screens/search_screen.dart';
import 'package:tiktok_clone/views/screens/video_screen.dart';

// Colors
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// firebase

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// AuthController
var authController = AuthController.instance;

// pages

List pages = [
  VideoScreen(),
  SearchScreen(),
  const AddVideoscreen(),
  const Text(
    'Message Screen',
    style: TextStyle(
      color: Colors.white,
    ),
  ),
  ProfileScreen(uid: authController.user.uid),
];
