import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThirdScreenProvider {
  ProviderRef ref;
  ThirdScreenProvider({required this.ref});

  static bool isAnimated = false;

  final animProvider1 = StateProvider((ref) => 0.0);
  final animProvider2 = StateProvider((ref) => 0.0);
  final animProvider3 = StateProvider((ref) => 0.0);
  final animProvider4 = StateProvider((ref) => 0.0);
  final animProvider5 = StateProvider((ref) => 0.0);

  startThirdScreenAnimation() async {
    if (isAnimated) return;
    isAnimated = true;
    ref.read(animProvider1.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 100));
    ref.read(animProvider2.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 100));
    ref.read(animProvider3.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 100));
    ref.read(animProvider4.notifier).update((state) => 1);

    await Future.delayed(const Duration(milliseconds: 100));
    ref.read(animProvider5.notifier).update((state) => 1);
  }
}
