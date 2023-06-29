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
  late Future<List<CameraDescription>> _cameras;
  late bool wasSwitched;
  bool _isControllerDisposed = false;

  @override
  void initState() {
    super.initState();
    _cameras = availableCameras().then((List<CameraDescription> cameras) {
      if (cameras.isNotEmpty) {
        _initializeController(FFAppState().switchCam ? 1 : 0);
      } else {
        print("No cameras available.");
      }
      return cameras;
    });
    wasSwitched = FFAppState().switchCam;
  }

  Future<void> _initializeController(int cameraIndex) async {
    if (controller != null) {
      _isControllerDisposed = true;
      await controller!.dispose();
      controller = null;
    }
    _isControllerDisposed = false;
    var cameras = await _cameras;
    controller = CameraController(
      cameras[cameraIndex],
      ResolutionPreset.max,
    );
    await controller!.initialize();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant CameraPhoto oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (wasSwitched != FFAppState().switchCam) {
      _initializeController(FFAppState().switchCam ? 1 : 0);
      wasSwitched = FFAppState().switchCam;
    }
    if (FFAppState().makePhoto &&
        controller != null &&
        !_isControllerDisposed) {
      controller!.takePicture().then((file) async {
        Uint8List fileAsBytes = await file.readAsBytes();
        // Compress the image
        var result = await FlutterImageCompress.compressWithList(
          fileAsBytes,
          minHeight: 1920,
          minWidth: 1080,
          quality: 55,
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
    _isControllerDisposed = true;
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller != null &&
            controller!.value.isInitialized &&
            !_isControllerDisposed
        ? MaterialApp(
            home: CameraPreview(controller!),
          )
        : Center(child: CircularProgressIndicator());
  }
}
