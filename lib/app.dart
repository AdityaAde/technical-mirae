import 'package:boilerplate_flutter/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'component/component.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final ThemeCubit _themeCubit;
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    _themeCubit = ThemeCubit.create();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return BlocProvider.value(
      value: _themeCubit,
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        builder: (context, child) => BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => MaterialApp.router(
                routerConfig: _appRouter.config(),
                theme: theme(context),
              ),
              success: (value) => MaterialApp.router(
                routerConfig: _appRouter.config(),
                darkTheme: value ? ThemeData.dark() : ThemeData.light(),
                themeMode: value ? ThemeMode.dark : ThemeMode.light,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _themeCubit.close();
    super.dispose();
  }
}
