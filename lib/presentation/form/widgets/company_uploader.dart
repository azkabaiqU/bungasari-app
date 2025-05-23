import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class CompanyUploader extends StatelessWidget {
  final String title;
  final String? fileName;
  final dynamic selectedImage; // Bisa berupa File, Uint8List, dsb.
  final VoidCallback onPickImage;
  final VoidCallback onRemoveImage;
  final String Function(String, int) truncateFileName;

  const CompanyUploader({
    super.key,
    required this.title,
    required this.fileName,
    required this.selectedImage,
    required this.onPickImage,
    required this.onRemoveImage,
    required this.truncateFileName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontFamily: "SfPro",
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 7),
        Column(
          children: [
            if (selectedImage == null)
              DottedBorder(
                color: Colors.black,
                strokeWidth: 0.5,
                dashPattern: [10, 10],
                borderType: BorderType.RRect,
                radius: Radius.circular(7),
                child: SizedBox( // ✅ Tambahkan ini
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: onPickImage,
                    padding: EdgeInsets.zero,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
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
            if (fileName != null)
              DottedBorder(
                color: Colors.black,
                strokeWidth: 0.5,
                dashPattern: [10, 10],
                borderType: BorderType.RRect,
                radius: Radius.circular(7),
                child: SizedBox( // ✅ Tambahkan ini juga
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: onPickImage,
                    padding: EdgeInsets.zero,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              truncateFileName(fileName!, 30),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: onRemoveImage,
                            child: const Icon(Icons.close),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
