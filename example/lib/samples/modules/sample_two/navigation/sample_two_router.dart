import 'package:flutter/material.dart';
import 'package:nuvigator/nuvigator.dart';
import 'package:provider/provider.dart';

import '../bloc/sample_two_bloc.dart';
import '../screen/screen_one.dart';
import '../screen/screen_two.dart';

part 'sample_two_router.g.dart';

@NuRouter(routeNamePrefix: '/samples/sampleTwo')
class SampleTwoRouter extends BaseRouter {
  @NuRoute(path: '/screenOne')
  ScreenRoute<String> screenOne({String testId}) => const ScreenRoute(
        builder: ScreenOne.builder,
      );

  @NuRoute(path: '/screenTwo')
  ScreenRoute<String> screenTwo() =>
      const ScreenRoute<String>(builder: ScreenTwo.builder);

  @override
  WrapperFn get screensWrapper => (BuildContext context, Widget screenWidget) {
        return Provider<SampleTwoBloc>.value(
          value: SampleTwoBloc(),
          child: screenWidget,
        );
      };

  @override
  Map<RouteDef, ScreenRouteBuilder> get screensMap =>
      _$sampleTwoScreensMap(this);
}
