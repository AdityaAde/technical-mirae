import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../component/theme/theme.dart';
import 'controller/mqtt_controller.dart';
import 'widgets/widgets.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  final MqttHandler _mqttHandler = MqttHandler();

  WelcomePage({super.key});

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
              ConnectInputWidget(mqttHandler: _mqttHandler),
              ConnectButtonWidget(mqttHandler: _mqttHandler),
              Text(value)
            ],
          ),
        ),
      ),
    );
  }
}
