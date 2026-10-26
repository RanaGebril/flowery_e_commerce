import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhotoPicker extends StatelessWidget {
  final File? photo;
  final ValueChanged<File?> onChanged;

  const ProfilePhotoPicker({
    super.key,
    required this.photo,
    required this.onChanged,
  });

  Future<void> _pick(ImageSource source) async {
    final picked = await ImagePicker().pickImage(
      source: source,
      maxWidth: 1024,
      imageQuality: 80,
    );
    if (picked != null) onChanged(File(picked.path));
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text('gallery'.tr()),
              onTap: () {
                Navigator.pop(sheetContext);
                _pick(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: Text('camera'.tr()),
              onTap: () {
                Navigator.pop(sheetContext);
                _pick(ImageSource.camera);
              },
            ),
            if (photo != null)
              ListTile(
                leading: const Icon(Icons.delete_outline),
                title: Text('removePhoto'.tr()),
                onTap: () {
                  Navigator.pop(sheetContext);
                  onChanged(null);
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final radius = context.setWidth(90);

    return GestureDetector(
      onTap: () => _showOptions(context),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(context.setWidth(4)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: colorScheme.primary.withAlpha(80),
                width: context.setWidth(2),
              ),
            ),
            child: CircleAvatar(
              radius: radius,
              backgroundColor: colorScheme.primary.withAlpha(30),
              backgroundImage: photo != null ? FileImage(photo!) : null,
              child: photo == null
                  ? Icon(
                      Icons.perm_identity,
                      size: context.setMinSize(radius * 1.2),
                      color: colorScheme.primary,
                    )
                  : null,
            ),
          ),
          Positioned(
            bottom: context.setHeight(8),
            right: context.setWidth(8),
            child: CircleAvatar(
              radius: context.setWidth(20),
              backgroundColor: colorScheme.primary,
              child: Icon(
                photo == null ? Icons.add : Icons.edit,
                size: context.setWidth(20),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
