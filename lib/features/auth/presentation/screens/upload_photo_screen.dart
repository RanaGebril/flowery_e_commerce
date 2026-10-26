import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/upload_photo/upload_photo_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UploadPhotoScreen extends StatelessWidget {
  const UploadPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profilePhoto".tr()),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(child: UploadPhotoBody()),
    );
  }
}
