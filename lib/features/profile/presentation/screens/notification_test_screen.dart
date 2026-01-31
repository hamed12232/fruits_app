import 'package:flutter/material.dart';
import 'package:fruits_app/core/services/notification_services.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';

class NotificationTestScreen extends StatelessWidget {
  const NotificationTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Notification System Test',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(height: AppHeight.h20),

            const Text(
              'Interactive Tests',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            VerticalSpace(height: AppHeight.h12),

            _buildExampleCard(
              context,
              title: 'Basic Local Notification',
              description: 'Simple notification with custom icon/sound',
              onPressed: () {
                NotificationService.showNotification(
                  title: 'Local Test 🔔',
                  body: 'This is a local notification with custom settings.',
                );
              },
            ),

            VerticalSpace(height: AppHeight.h16),

            _buildExampleCard(
              context,
              title: 'Notification with Actions',
              description: 'Has 2 buttons: OK and CANCEL',
              onPressed: () {
                NotificationService.showNotification(
                  title: 'Action Required',
                  body: 'Please select an action below.',
                );
              },
            ),

            VerticalSpace(height: AppHeight.h16),

            const Divider(),
            VerticalSpace(height: AppHeight.h16),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleCard(
    BuildContext context, {
    required String title,
    required String description,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: AppColors.greyTextColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: PrimaryButton(label: 'Test Scenario', onPressed: onPressed),
          ),
        ],
      ),
    );
  }
}
