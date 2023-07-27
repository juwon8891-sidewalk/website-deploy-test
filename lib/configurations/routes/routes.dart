import 'package:auto_route/auto_route.dart';
import 'package:stepin_website/configurations/routes/routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen")
class WebRouter extends $WebRouter {
  @override
  List<AutoRoute> get routes =>
      [AutoRoute(page: HomeRoute.page, initial: true)];
}
