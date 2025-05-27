import 'dart:io';
import 'package:flutter/material.dart';
import '../widget/image/image_widget.dart';
import '../widget/appbar/my_appbar.dart';

class ShowImageView extends StatelessWidget {
  const ShowImageView({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWithLogo(),
      body: Center(child: ImageWidget(image, fit: BoxFit.fitWidth)),
    );
  }
}

class ShowImageFileView extends StatelessWidget {
  const ShowImageFileView({super.key, required this.image});

  final File image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWithLogo(),
      body: Center(child: Image.file(image, fit: BoxFit.fitWidth)),
    );
  }
}
