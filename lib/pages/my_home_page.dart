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
  List<String> ext = ['epub', 'pdf'];
  final List<String> books = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('📖'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (books.isEmpty) ...[
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        bool hasPermission =
                            await Utils.requestStoragePermission();
                        if (!hasPermission) {
                          return;
                        }

                        final result = await FilePicker.platform.pickFiles();
                        if (result == null) {
                          return;
                        }
                        if (ext.contains(result.files.first.extension)) {
                          books.add(result.files.first.name);
                        } else {
                          debugPrint('not supported');
                        }
                      },
                      child: const Text('Upload')),
                ),
              ] else
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                      itemCount: books.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => ListTile(
                            title: Text(books[index]),
                          )),
                )
            ],
          ),
        ),
      ),
    );
  }
}
