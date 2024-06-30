import 'package:flutter/material.dart';

class ImageOpening extends StatelessWidget {
  final String name_1;
  final String image_1;
  const ImageOpening({super.key, required this.name_1, required this.image_1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          name_1,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Hero(
              tag: image_1,
              child: Image.asset(
                image_1,
                fit: BoxFit.cover,
                width: MediaQuery.sizeOf(context).width * 0.70,
                height: 500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
