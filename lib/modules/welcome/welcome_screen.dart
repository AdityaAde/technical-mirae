import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/theme/theme.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MQTT')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Status Connected',
              style: AppStyle.materialTextStyle.bodyMedium
                  ?.copyWith(color: AppColor.green),
            ),
            SizedBox(height: 8.h),
            const TextField(
                decoration: InputDecoration(hintText: 'Enter Broker Address')),
            SizedBox(height: 8.h),
            const TextField(
                decoration: InputDecoration(hintText: 'Enter Topic')),
            SizedBox(height: 12.h),
            Row(
              children: [
                const Expanded(
                  child: TextField(
                      decoration: InputDecoration(hintText: 'Enter Message')),
                ),
                SizedBox(width: 4.w),
                ElevatedButton(onPressed: () {}, child: const Text('Send'))
              ],
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.green,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Connect',
                      style: TextStyle(color: AppColor.ink06),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.utilityDangerError,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Disconnect',
                      style: TextStyle(color: AppColor.ink06),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
