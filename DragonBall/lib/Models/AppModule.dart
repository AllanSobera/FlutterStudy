import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_study/View/characterListCubit.dart';
import 'package:new_study/View/detailsCharacterCubit.dart';
import 'package:new_study/View/detailsScreen.dart';
import 'package:new_study/View/startScreen.dart';
import 'Service/Service.dart';
import '../View/main.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(DragonBallAPI.new);
    i.addSingleton(CharacterListCubit.new);
    i.addSingleton(
      DetailsCharacterCubit.new,
      key: DetailsCharacterCubit.valueKey.value,
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      "/",
      child: (_) => const StartScreen(),
    );
    r.child(
      DetailsScreen.screenRoute,
      child: (_) => DetailsScreen(
        id: r.args.params['id'],
      ),
    );
  }
}
