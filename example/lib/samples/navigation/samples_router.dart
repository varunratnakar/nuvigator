import 'package:example/samples/modules/sample_two/bloc/sample_flow_bloc.dart';
import 'package:flutter/material.dart';
import 'package:nuvigator/nuvigator.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../bloc/samples_bloc.dart';
import '../modules/sample_one/navigation/sample_one_router.dart';
import '../modules/sample_two/navigation/sample_two_router.dart';

part 'samples_router.g.dart';

@NuRouter()
class SamplesRouter extends BaseRouter {
  @override
  String get deepLinkPrefix => '/samples';

  @NuRoute(path: '/home')
  ScreenRoute home() => ScreenRoute(builder: (context) => HomeScreen(context));

  @NuRoute(path: '/second/:testId')
  FlowRoute<SampleTwoRouter, void> second({String testId}) => FlowRoute(
        nuvigator: Nuvigator(
          router: SampleTwoRouter(),
          initialRoute: SampleTwoRoutes.screenOne,
          screenType: cupertinoScreenType,
          wrapper: (BuildContext context, Widget child) => Provider(
            builder: (_) => SampleFlowBloc(),
            child: child,
          ),
        ),
      );

  @override
  WrapperFn get screensWrapper => (BuildContext context, Widget child) {
        return Provider<SamplesBloc>.value(
          value: SamplesBloc(),
          child: child,
        );
      };

  @override
  Map<RouteDef, ScreenRouteBuilder> get screensMap => _$samplesScreensMap(this);
}

class MainSamplesRouter extends BaseRouter {
  @override
  List<Router> get routers => [
        SamplesRouter(),
        FlowRouter(
          SampleOneRouter(),
          screensType: materialScreenType,
        ),
      ];
}
