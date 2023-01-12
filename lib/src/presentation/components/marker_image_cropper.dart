import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:math';

import '../../core/constants/constants.dart';

class ImageCropper {
  Future<BitmapDescriptor> resizeAndCircle(String? imageURL, int size) async {
    final File imageFile = await _urlToFile(imageURL);
    final Uint8List byteData = imageFile.readAsBytesSync();
    final ui.Image image = await _resizeAndConvertImage(byteData, size, size);
    return _paintToCanvas(image, Size.zero);
  }

  Future<File> _urlToFile(String? imageUrl) async {
    final rd = Random();
    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = tempDir.path;
    final File file = File('$tempPath${rd.nextInt(100)}.png');
    final http.Response response =
        await http.get(Uri.parse('${AppConstants.imageBaseUrl}/$imageUrl'));
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }

  Future<ui.Image> _resizeAndConvertImage(
    Uint8List data,
    int height,
    int width,
  ) async {
    final img.Image? baseSizeImage = img.decodeImage(data);
    final img.Image resizeImage =
        img.copyResize(baseSizeImage!, height: height, width: width);
    final ui.Codec codec = await ui
        .instantiateImageCodec(Uint8List.fromList(img.encodePng(resizeImage)));
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  Future<BitmapDescriptor> _paintToCanvas(ui.Image image, Size size) async {
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final paint = Paint();
    paint.isAntiAlias = true;

    _performCircleCrop(image, size, canvas);

    final recordedPicture = pictureRecorder.endRecording();
    ui.Image img = await recordedPicture.toImage(image.width, image.height);
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final buffer = byteData?.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(buffer!);
  }

  Canvas _performCircleCrop(ui.Image image, Size size, Canvas canvas) {
    Paint paint = Paint();
    canvas.drawCircle(const Offset(0, 0), 0, paint);

    double drawImageWidth = 0;
    double drawImageHeight = 0;
    double imageW = image.width.toDouble();
    double imageH = image.height.toDouble();
    final Path path = Path()
      ..addOval(
        Rect.fromLTRB(
          drawImageWidth + imageW / 8,
          drawImageHeight + imageH / 8,
          imageW - imageW / 8,
          imageH - imageH / 8,
        ),
      );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          drawImageWidth,
          drawImageHeight,
          imageW,
          imageH,
        ),
        Radius.circular(image.width / 5),
      ),
      Paint()..color = Colors.white,
    );
    canvas.clipPath(path);
    canvas.drawImage(image, Offset(drawImageWidth, drawImageHeight), Paint());
    return canvas;
  }
}
