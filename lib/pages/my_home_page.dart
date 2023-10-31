import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:send_to_kindle/shared/utils/utils.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('📖'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                bool hasPermission = await Utils.requestStoragePermission();
                if (!hasPermission) {
                  return;
                }

                final result = await FilePicker.platform.pickFiles();
                if (result == null) {
                  return;
                }
                debugPrint('${result.names.first}');
              },
              child: const Text('Upload'))
        ],
      ),
    );
  }
}
