import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_form_field.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class EditProfileDialog extends StatefulWidget {
  final String initialName;
  final Function(String) onSave;

  const EditProfileDialog({
    super.key,
    required this.initialName,
    required this.onSave,
  });

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Edit Profile',
              style: font18w700.copyWith(color: const Color(0xFF0F2B46)),
            ),
            SizedBox(height: 20.h),
            AppFormField(
              controller: _nameController,
              hintText: 'Enter your name',
              keyboardType: TextInputType.name,
              fillColor: const Color(0xFFF8FAFC),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () => Navigator.pop(context),
                    text: 'Cancel',
                    color: Colors.white,
                    textColor: const Color(0xFF0F2B46),
                    borderColor: const Color(0xFFE2E8F0),
                    radius: 12.r,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: AppButton(
                    onPressed: () {
                      final newName = _nameController.text.trim();
                      if (newName.isNotEmpty) {
                        widget.onSave(newName);
                        Navigator.pop(context);
                      }
                    },
                    text: 'Save',
                    color: const Color(0xFF0B48C6),
                    textColor: Colors.white,
                    radius: 12.r,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
