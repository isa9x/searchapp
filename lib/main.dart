import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchapp/cubits/post/post_cubit.dart';
import 'package:searchapp/cubits/post/post_state.dart';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aplikasi Searching")),
      body: BlocProvider(
        create: (_) => PostCubit(),
        child: const PostPage(),
      ),
    );
  }
}

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late TextEditingController textSearch;
  late PostCubit _postCubit;

  @override
  void initState() {
    textSearch = TextEditingController();
    _postCubit = BlocProvider.of<PostCubit>(context);
    _postCubit.getPostsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: textSearch,
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {
                    _postCubit.getPost(id: textSearch.text);
                  },
                  child: const Text("Cari"),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {
                    _postCubit.getPostsList();
                  },
                  child: const Text("Reset"),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              if (state is PostLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
              }
              if (state is PostsListLoaded) {
                return state.listPost.isEmpty
                    ? const Center(
                        child: Text('No Posts'),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.listPost.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(state.listPost[index].title!),
                              subtitle: Text(state.listPost[index].body!),
                            ),
                          );
                        },
                      );
              }
              if (state is PostErrorLoaded) {
                return const Center(
                  child: Text('Terjadi Kesalahan'),
                );
              }
              if (state is PostLoaded) {
                return Card(
                  child: ListTile(
                    title: Text(state.post.title!),
                    subtitle: Text(state.post.body!),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        )
      ],
    );
  }
}
