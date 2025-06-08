import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class CompanyUploader extends StatelessWidget {
  final String title;
  final ValueNotifier<File?> valueNotifier; // Ubah di sini
  final String? fileName;
  final TextEditingController controller;
  final dynamic selectedImage;
  final VoidCallback onPickImage;
  final VoidCallback onRemoveImage;
  final String Function(String, int) truncateFileName;

  const CompanyUploader({
    super.key,
    required this.title,
    required this.valueNotifier, // Ubah di sini
    required this.fileName,
    required this.controller,
    required this.selectedImage,
    required this.onPickImage,
    required this.onRemoveImage,
    required this.truncateFileName,
  });

  @override
  Widget build(BuildContext context) {
    final hasFile = fileName != null && selectedImage != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "SfPro",
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller, // Ubah di sini
          readOnly: true,
          decoration: const InputDecoration(
            hintText: 'Nama file akan muncul di sini',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
        ),
        const SizedBox(height: 7),
        DottedBorder(
          color: Colors.black,
          strokeWidth: 0.5,
          dashPattern: [10, 10],
          borderType: BorderType.RRect,
          radius: const Radius.circular(7),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                onPickImage();
              },
              padding: EdgeInsets.zero,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: hasFile
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        truncateFileName(fileName!, 30),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onRemoveImage();
                        valueNotifier.value = null; // Clear ValueNotifier
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                )
                    : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.cloud_upload_outlined, size: 32),
                    SizedBox(height: 8),
                    Text(
                      'Upload Your\n Document Here',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
