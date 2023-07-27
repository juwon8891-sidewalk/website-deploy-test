import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstScreenProvider {
  ProviderRef ref;
  FirstScreenProvider({required this.ref});

  final animProvider1 = StateProvider((ref) => 0.0);
  final animProvider2 = StateProvider((ref) => 0.0);
  final animProvider3 = StateProvider((ref) => 0.0);

  startFirstScreenAnimation() async {
    await Future.delayed(const Duration(milliseconds: 200));

    ref.read(animProvider1.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 300));
    ref.read(animProvider2.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 200));
    ref.read(animProvider3.notifier).update((state) => 1);
  }
}
