import 'package:boilerplate_flutter/component/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/mqtt_controller.dart';

class ConnectInputWidget extends StatelessWidget {
  const ConnectInputWidget({super.key, required this.mqttHandler});

  final MqttHandler mqttHandler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 32.h),
      child: Column(
        children: [
          TextFormField(
            initialValue: Keys.brokerAddress,
            readOnly: true,
          ),
          SizedBox(height: 8.h),
          TextFormField(
            initialValue: Keys.clientIdentifier,
            readOnly: true,
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter Topic'),
            onChanged: (value) => mqttHandler.topicSubscribed.value = value,
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
