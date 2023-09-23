import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';

class ImageField extends StatefulWidget {
  const ImageField({
    super.key,
  });

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  final ImagePicker picker = ImagePicker();
  String imagePath = '';

  Future pickedImage() async {
    final XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imagePath = imageFile?.path ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: 'images',
      builder: (fieldProps) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DottedBorder(
              color: Colors.grey,
              dashPattern: const [5, 3],
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(6),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: imagePath == '' ? const SizedBox() : Image.network(imagePath, fit: BoxFit.cover),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                pickedImage();
              },
              child: const Text("이미지 추가"),
            ),
          ],
        );
      },
    );
  }
}
