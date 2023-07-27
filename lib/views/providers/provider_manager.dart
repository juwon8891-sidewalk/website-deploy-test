import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stepin_website/views/providers/first_screen_provider.dart';
import 'package:stepin_website/views/providers/second_screen_provider.dart';
import 'package:stepin_website/views/providers/third_screen_provider.dart';

final providerManager = Provider((ref) => ProviderManager(ref: ref));

class ProviderManager {
  ProviderRef ref;
  ProviderManager({required this.ref});

  late final firstScreenProvider = FirstScreenProvider(ref: ref);
  late final secondScreenProvider = SecondScreenProvider(ref: ref);
  late final thirdScreenProvider = ThirdScreenProvider(ref: ref);
}
