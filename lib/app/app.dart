import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_bloc_template/app/app_cubit/app_cubit.dart';
import 'package:new_bloc_template/app/app_cubit/app_state.dart';
import 'package:new_bloc_template/core/config/theme/light/light_theme.dart';
import 'package:new_bloc_template/core/enum/language.dart';
import 'package:new_bloc_template/di/injector.dart';
import 'package:new_bloc_template/l10n/app_localizations.dart';
import 'package:new_bloc_template/observer/logging_observer.dart';
import 'package:new_bloc_template/router/router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppRouter appRouter;

  @override
  void initState() {
    appRouter = getIt<AppRouter>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      child: BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) {
          if (previous.mode != current.mode ||
              previous.currentLanguage != current.currentLanguage) {
            return true;
          }

          return false;
        },
        builder: (context, state) {
          return MaterialApp.router(
            themeMode: state.mode,
            routerDelegate: getIt<AppRouter>().delegate(
              navigatorObservers: () => [AutoRouteObserver(), LoggingRouteObserver()],
            ),
            routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
            routeInformationProvider: getIt<AppRouter>().routeInfoProvider(),
            locale: state.currentLanguage.locale,
            debugShowCheckedModeBanner: false,
            theme: lightThemeData,
            builder: FToastBuilder(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
