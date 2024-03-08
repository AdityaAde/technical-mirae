import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../component/theme/theme.dart';
import '../controller/mqtt_controller.dart';

class ConnectButtonWidget extends StatelessWidget {
  const ConnectButtonWidget({
    super.key,
    required this.mqttHandler,
  });

  final MqttHandler mqttHandler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.h),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.utilityDangerError,
              ),
              onPressed: () => mqttHandler.disconnect(),
              child: const Text(
                'Disconnect',
                style: TextStyle(color: AppColor.ink06),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.green),
              onPressed: () =>
                  mqttHandler.connect(mqttHandler.topicSubscribed.value),
              child: const Text(
                'Connect',
                style: TextStyle(color: AppColor.ink06),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
