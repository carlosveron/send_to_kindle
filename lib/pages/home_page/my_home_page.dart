import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:send_to_kindle/main.dart';
import 'package:send_to_kindle/pages/settings_page/settings_page.dart';
import 'package:send_to_kindle/shared/services/database/models/books.dart';
import 'package:send_to_kindle/shared/services/provider/providers.dart';
import 'package:send_to_kindle/shared/utils/utils.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  List<Books>? books;
  @override
  Widget build(BuildContext context) {
    final userSettings = ref.watch(userSettingsProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('📖'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const SettingsPage())),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<RealmResultsChanges<Books>>(
            stream: database.getResultsAsStream(),
            builder: (context, snapshot) {
              books = snapshot.data?.results.toList();
              Future(() => ref.read(booksProvider.notifier).state = books);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (books == null || books!.isEmpty) ...[
                    Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            _getFile();
                          },
                          child: const Text('Upload')),
                    ),
                  ] else ...[
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 110,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                          itemCount: books?.length ?? 0,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) => ListTile(
                                title: Text(books?[index].title ??
                                    books![index].path.split('/').last),
                                onTap: () async {
                                  final email = Email(
                                    body: 'To Kindle',
                                    subject: 'book to kindle',
                                    recipients: userSettings!.kindleEmail,
                                    attachmentPaths: [books?[index].path ?? ''],
                                    isHTML: false,
                                  );

                                  await FlutterEmailSender.send(email);
                                },
                              )),
                    )
                  ]
                ],
              );
            }),
      ),
      floatingActionButton: Visibility(
        visible: ref.watch(booksProvider) != null &&
            ref.watch(booksProvider)!.isNotEmpty,
        child: FloatingActionButton(
          onPressed: () async {
            _getFile();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _getFile() async {
    bool hasPermission = await Utils.requestStoragePermission();
    if (!hasPermission) {
      return;
    }

    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    }

    if (Utils.isEpub(result.files.first.path ?? '')) {
      final book = Books(
        result.files.first.path ?? '',
        DateTime.now(),
        result.files.first.path ?? '',
        result.files.first.size,
      );

      database.save<Books>(book);
    } else {
      _showScafoldMessenger();
    }
  }

  _showScafoldMessenger() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: SizedBox(
          child: SizedBox(
            width: 200,
            child: Text(
                'Oops! It seems like the file extension you provided is not supported. '),
          ),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5)));
  }
}
