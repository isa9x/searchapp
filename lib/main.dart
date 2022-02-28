import 'package:flutter/material.dart';
import 'package:searchapp/models/post.dart';
import 'package:searchapp/repo/post_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PostRepo _postRepo = PostRepo();
  late TextEditingController textSearch;
  List<Post> listPosts = [];
  List<Post> listPostsTemp = [];

  @override
  void initState() {
    initValue();
    super.initState();
  }

  void initValue() async {
    textSearch = TextEditingController();
    listPosts = await _postRepo.getPosts();
  }

  void searchPost(String id) async {
    listPostsTemp = await _postRepo.getPosts(id: id);
    setState(() {
      listPosts.clear();
      listPosts = listPostsTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aplikasi Searching")),
      body: Column(children: [
        Row(
          children: [
            TextFormField(
              controller: textSearch,
              decoration: const InputDecoration(hintText: "Search"),
            ),
            ElevatedButton(
              onPressed: () => searchPost(textSearch.text),
              child: const Text('Cari'),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: listPosts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listPosts[index].title!),
              subtitle: Text(listPosts[index].body!),
            );
          },
        )
      ]),
    );
  }
}
