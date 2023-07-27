import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstMobileScreenProvider {
  ProviderRef ref;
  FirstMobileScreenProvider({required this.ref});

  final screenProvider = StateProvider((ref) => 0.0);

  final animProvider1 = StateProvider((ref) => 0.0);
  final animProvider2 = StateProvider((ref) => 0.0);
  final animProvider3 = StateProvider((ref) => 0.0);

  startFirstScreenAnimation() async {
    ref.read(screenProvider.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 200));

    ref.read(animProvider1.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 300));
    ref.read(animProvider2.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 200));
    ref.read(animProvider3.notifier).update((state) => 1);
  }

  stopFirstScreenAnimation() async {
    ref.read(screenProvider.notifier).update((state) => 0);
    ref.read(animProvider1.notifier).update((state) => 0);
    ref.read(animProvider2.notifier).update((state) => 0);
    ref.read(animProvider3.notifier).update((state) => 0);
  }
}
