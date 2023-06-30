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
    selectedCameraIndex = selectedCameraIndex < _cameraList.length - 1
        ? selectedCameraIndex + 1
        : 0;
    _initializeController();
  }

  @override
  void didUpdateWidget(covariant CameraPhoto oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (FFAppState().makePhoto) {
      controller!.takePicture().then((file) async {
        Uint8List fileAsBytes = await file.readAsBytes();
        // Compress the image
        var result = await FlutterImageCompress.compressWithList(
          fileAsBytes,
          minHeight: 1920,
          minWidth: 1080,
          quality: 60,
        );
        FFAppState().update(() {
          FFAppState().makePhoto = false;
        });
        String dir = '/users/' + currentUserUid + '/flicks/';
        final downloadUrl = await uploadData(
            dir + FFAppState().index.toString() + '.jpg', result);
        FFAppState().update(() {
          FFAppState().index = FFAppState().index + 1;
          FFAppState().filePath = downloadUrl ?? '';
        });
      }).catchError((error) {});
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
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
                          child: Icon(Icons.flip_camera_android),
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
