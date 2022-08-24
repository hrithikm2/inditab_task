import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class ImageLogo extends StatelessWidget {
  const ImageLogo({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (H(context) * 8) + 5,
      width: (H(context) * 8) + 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: ClipOval(
        child: ExtendedImage.network(
            // placeholder: (context, string) =>
            //     Container(),
            imageUrl,
            height: H(context) * 8,
            cache: true,
            width: H(context) * 8,
            fit: BoxFit.cover),
      ),
    );
  }
}
