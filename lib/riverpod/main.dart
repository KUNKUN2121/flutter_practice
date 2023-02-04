import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// RiverPod使う。
// 参考 https://youtu.be/w2xo2FjDUNQ

main() {
  // アプリ
  const app = MaterialApp(home: Sample());
  // プロバイダースコープでアプリを囲む
  const scope = ProviderScope(child: app);
  runApp(scope);
}

final nicknameProvider = StateProvider<String>((ref) {
  return "ルビードッグ";
});

class Sample extends ConsumerWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // データを見張っておく
    final nickname = ref.watch(nicknameProvider);

    return Scaffold(
      // ニックネーム 1
      appBar: AppBar(title: Text(nickname)),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ニックネーム 2
            Text(nickname),
            ElevatedButton(onPressed: () => tapA(ref), child: const Text('A')),
            ElevatedButton(onPressed: () => tapB(ref), child: const Text('B')),
            ElevatedButton(onPressed: () => tapC(ref), child: const Text('C')),
            // ニックネーム 3
            Text(nickname),
          ],
        ),
      ),
    );
  }

  // ノティファイア でデータを変更する

  tapA(WidgetRef ref) {
    final notifier = ref.read(nicknameProvider.notifier);
    notifier.state = 'ルビーキャット';
  }

  tapB(WidgetRef ref) {
    final notifier = ref.read(nicknameProvider.notifier);
    notifier.state = 'ルビーバード';
  }

  tapC(WidgetRef ref) {
    final notifier = ref.read(nicknameProvider.notifier);
    notifier.state = 'ルビーフィッシュ';
  }
}
