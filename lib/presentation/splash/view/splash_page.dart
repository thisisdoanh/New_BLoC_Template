import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:new_bloc_template/core/base_component/base_view.dart';
import 'package:new_bloc_template/presentation/splash/cubit/splash_cubit.dart';
import 'package:new_bloc_template/presentation/splash/cubit/splash_state.dart';

@RoutePage()
class SplashPage extends BaseViewStateful<SplashCubit, SplashState> {
  const SplashPage({super.key});

  @override
  Widget buildView(BuildContext context, SplashState state) {
    return const Scaffold(body: Text('Splash Page'));
  }
}
