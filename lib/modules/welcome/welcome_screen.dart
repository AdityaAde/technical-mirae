import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/theme/theme.dart';
import 'controller/mqtt_controller.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final MqttHandler _mqttHandler = MqttHandler();

  @override
  void initState() {
    super.initState();
    _mqttHandler.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MQTT'), centerTitle: true),
      body: ValueListenableBuilder<String>(
        valueListenable: _mqttHandler.data,
        builder: (_, value, __) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ValueListenableBuilder<String>(
                valueListenable: _mqttHandler.isConnected,
                builder: (_, status, __) => Text(
                  status,
                  style: AppStyle.materialTextStyle.bodyMedium?.copyWith(
                    color: status == 'Connected'
                        ? AppColor.green
                        : AppColor.utilityDangerError,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              const TextField(
                  decoration:
                      InputDecoration(hintText: 'Enter Broker Address')),
              SizedBox(height: 8.h),
              const TextField(
                  decoration:
                      InputDecoration(hintText: 'Enter Client Identifier')),
              const SizedBox(height: 8),
              const TextField(
                  decoration: InputDecoration(hintText: 'Enter Topic')),
              SizedBox(height: 12.h),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                        decoration: InputDecoration(hintText: 'Enter Message')),
                  ),
                  SizedBox(width: 12.w),
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
              ),
              SizedBox(height: 22.h),
              Text(value)
            ],
          ),
        ),
      ),
    );
  }
}
