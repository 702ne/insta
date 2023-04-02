import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:insta/const/screen_size.dart';
import 'package:insta/widgets/my_progress_Indicator.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({
    super.key,
  });

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  late CameraController _cameraController;
  final Widget _progressIndicator = MyProgressIndicator(
    containerSize: screenSize!.width,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CameraDescription>>(
        future: availableCameras(),
        builder: (context, snapshot) {
          return Column(
            children: [
              Container(
                color: Colors.black,
                width: screenSize!.width,
                height: screenSize!.width,
                child: (snapshot.hasData)
                    ? _getPreview(snapshot)
                    : _progressIndicator,
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    print('button Take tabbed');
                  },
                  style: OutlinedButton.styleFrom(
                    shape: const CircleBorder(),
                    side: const BorderSide(color: Colors.black12, width: 20),
                  ),
                  child: const Text(
                    '                             ',
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget _getPreview(AsyncSnapshot<List<CameraDescription>> cameras) {
    _cameraController =
        CameraController(cameras.data![0], ResolutionPreset.medium);

    return FutureBuilder(
      future: _cameraController.initialize(),
      builder: (context, snapshot) {
        if ((snapshot.connectionState == ConnectionState.done)) {
          return ClipRRect(
            child: OverflowBox(
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: SizedBox(
                    width: screenSize!.width,
                    height:
                        screenSize!.width / _cameraController.value.aspectRatio,
                    child: CameraPreview(_cameraController)),
              ),
            ),
          );
        } else {
          return _progressIndicator;
        }
      },
    );
  }
}
