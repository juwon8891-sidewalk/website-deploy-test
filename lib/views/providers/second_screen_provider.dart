import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondScreenProvider {
  ProviderRef ref;
  SecondScreenProvider({required this.ref});

  static bool isAnimated = false;

  final screenProvider = StateProvider((ref) => 0.0);

  final animProvider1 = StateProvider((ref) => 0.0);
  final animProvider2 = StateProvider((ref) => 0.0);
  final animProvider3 = StateProvider((ref) => 0.0);

  startSecondScreenAnimation() async {
    if (isAnimated) return;
    isAnimated = true;
    ref.read(animProvider1.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 100));
    ref.read(animProvider2.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 100));
    ref.read(animProvider3.notifier).update((state) => 1);
  }

  stopSecondScreenAnimation() async {
    ref.read(screenProvider.notifier).update((state) => 0);
    ref.read(animProvider1.notifier).update((state) => 0);
    ref.read(animProvider2.notifier).update((state) => 0);
    ref.read(animProvider3.notifier).update((state) => 0);
  }
}
