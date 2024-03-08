import 'package:auto_route/auto_route.dart';
import 'package:boilerplate_flutter/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../component/theme/theme.dart';
import 'controller/mqtt_controller.dart';
import 'widgets/widgets.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final MqttHandler _mqttHandler = MqttHandler();
  late final ValueNotifier<bool> _switchThemeController;

  @override
  void initState() {
    super.initState();
    _switchThemeController = ValueNotifier<bool>(false);
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MQTT',
        ),
        centerTitle: true,
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: _switchThemeController,
            builder: (_, value, __) => CupertinoSwitch(
                trackColor: AppColor.ink05,
                value: value,
                onChanged: (value) {
                  _switchThemeController.value = value;
                  themeCubit.setThemeMode(value);
                }),
          ),
        ],
      ),
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
