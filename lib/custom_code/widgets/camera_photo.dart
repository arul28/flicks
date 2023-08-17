// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'dart:math';

import 'package:image/image.dart' as img;

import 'package:photofilters/filters/filters.dart';
import 'package:photofilters/filters/preset_filters.dart';

import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/firebase_storage/storage.dart';
import 'package:camera/camera.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class CameraPhoto extends StatefulWidget {
  const CameraPhoto({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CameraPhotoState createState() => _CameraPhotoState();
}

class _CameraPhotoState extends State<CameraPhoto> {
  CameraController? controller;
  late Future<void> _initializeCameras;
  List<CameraDescription> _cameraList = [];
  int selectedCameraIndex =
      0; // Added to keep track of which camera is selected

  @override
  void initState() {
    super.initState();
    _initializeCameras = _getAvailableCameras();
  }

  Future<void> _getAvailableCameras() async {
    _cameraList = await availableCameras();
    _initializeController();
  }

  void _initializeController() {
    controller = CameraController(
        _cameraList[selectedCameraIndex], ResolutionPreset.max);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  // Function to switch camera
  void onSwitchCamera() {
    selectedCameraIndex = selectedCameraIndex == 0 ? 1 : 0;
    _initializeController();
  }

  @override
  void didUpdateWidget(covariant CameraPhoto oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (FFAppState().makePhoto) {
      FFAppState().update(() {
        FFAppState().uploadingPhoto = true;
      });
      controller!.takePicture().then((file) async {
        Uint8List fileAsBytes = await file.readAsBytes();

        // Check if the camera used is the front camera
        if (selectedCameraIndex == 1) {
          img.Image image = img.decodeImage(fileAsBytes)!;
          img.Image flippedImage = img.flipHorizontal(image);
          fileAsBytes = Uint8List.fromList(img.encodeJpg(flippedImage));
        }

        // Compress the image
        var result = await FlutterImageCompress.compressWithList(
          fileAsBytes,
          minHeight: 1920,
          minWidth: 1080,
          quality: 25,
        );
        FFAppState().update(() {
          FFAppState().makePhoto = false;
        });
        String dir = '/users/' + currentUserUid + '/flicks/';
        var rng = new Random();
        var index = rng.nextInt(999999);
        final downloadUrl =
            await uploadData(dir + index.toString() + '.jpg', result);
        // var rng = new Random();
        // var index = rng.nextInt(999999);

        FFAppState().update(() {
          // FFAppState().index = FFAppState().index + 1;
          FFAppState().filePath = downloadUrl ?? '';
          FFAppState().uploadingPhoto = false;
        });
      }).catchError((error) {});
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeCameras,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (_cameraList.isNotEmpty) {
            return controller!.value.isInitialized
                ? Stack(
                    children: <Widget>[
                      MaterialApp(
                        home: CameraPreview(controller!),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: FloatingActionButton(
                          backgroundColor: const Color.fromARGB(
                              255, 113, 16, 131), // Updated to purple
                          child: Icon(Icons
                              .flip_camera_android_outlined), // Updated to switch_camera icon
                          onPressed: onSwitchCamera,
                        ),
                      ),
                    ],
                  )
                : Container();
          } else {
            return Center(child: Text('No cameras available.'));
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
