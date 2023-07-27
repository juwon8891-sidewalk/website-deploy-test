import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileScreenProvider2 {
  ProviderRef ref;
  MobileScreenProvider2({required this.ref});

  final screenProvider = StateProvider((ref) => 0.0);

  final animProvider1 = StateProvider((ref) => 0.0);
  final animProvider2 = StateProvider((ref) => 0.0);
  final animProvider3 = StateProvider((ref) => 0.0);

  startAnimation() async {
    ref.read(screenProvider.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 200));

    ref.read(animProvider1.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 300));
    ref.read(animProvider2.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 200));
    ref.read(animProvider3.notifier).update((state) => 1);
  }

  stopAnimation() async {
    ref.read(screenProvider.notifier).update((state) => 0);
    ref.read(animProvider1.notifier).update((state) => 0);
    ref.read(animProvider2.notifier).update((state) => 0);
    ref.read(animProvider3.notifier).update((state) => 0);
  }
}

class MobileScreenProvider3 {
  ProviderRef ref;
  MobileScreenProvider3({required this.ref});

  final screenProvider = StateProvider((ref) => 0.0);

  final animProvider1 = StateProvider((ref) => 0.0);
  final animProvider2 = StateProvider((ref) => 0.0);
  final animProvider3 = StateProvider((ref) => 0.0);

  startAnimation() async {
    ref.read(screenProvider.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 200));

    ref.read(animProvider1.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 300));
    ref.read(animProvider2.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 200));
    ref.read(animProvider3.notifier).update((state) => 1);
  }

  stopAnimation() async {
    ref.read(screenProvider.notifier).update((state) => 0);
    ref.read(animProvider1.notifier).update((state) => 0);
    ref.read(animProvider2.notifier).update((state) => 0);
    ref.read(animProvider3.notifier).update((state) => 0);
  }
}

class MobileScreenProvider4 {
  ProviderRef ref;
  MobileScreenProvider4({required this.ref});

  final screenProvider = StateProvider((ref) => 0.0);

  final animProvider1 = StateProvider((ref) => 0.0);
  final animProvider2 = StateProvider((ref) => 0.0);
  final animProvider3 = StateProvider((ref) => 0.0);

  startAnimation() async {
    ref.read(screenProvider.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 200));

    ref.read(animProvider1.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 300));
    ref.read(animProvider2.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 200));
    ref.read(animProvider3.notifier).update((state) => 1);
  }

  stopAnimation() async {
    ref.read(screenProvider.notifier).update((state) => 0);
    ref.read(animProvider1.notifier).update((state) => 0);
    ref.read(animProvider2.notifier).update((state) => 0);
    ref.read(animProvider3.notifier).update((state) => 0);
  }
}

class MobileScreenProvider5 {
  ProviderRef ref;
  MobileScreenProvider5({required this.ref});

  final screenProvider = StateProvider((ref) => 0.0);

  final animProvider1 = StateProvider((ref) => 0.0);
  final animProvider2 = StateProvider((ref) => 0.0);
  final animProvider3 = StateProvider((ref) => 0.0);
  final animProvider4 = StateProvider((ref) => 0.0);
  final animProvider5 = StateProvider((ref) => 0.0);

  startAnimation() async {
    ref.read(screenProvider.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 200));

    ref.read(animProvider1.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 100));
    ref.read(animProvider2.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 100));
    ref.read(animProvider3.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 300));
    ref.read(animProvider4.notifier).update((state) => 1);
    await Future.delayed(const Duration(milliseconds: 100));
    ref.read(animProvider5.notifier).update((state) => 1);
  }

  stopAnimation() async {
    ref.read(screenProvider.notifier).update((state) => 0);
    ref.read(animProvider1.notifier).update((state) => 0);
    ref.read(animProvider2.notifier).update((state) => 0);
    ref.read(animProvider3.notifier).update((state) => 0);
    ref.read(animProvider4.notifier).update((state) => 0);
    ref.read(animProvider5.notifier).update((state) => 0);
  }
}
