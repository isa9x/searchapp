import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchapp/cubits/post/post_state.dart';

import '../../models/post.dart';
import '../../repo/post_repo.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepo _postRepo = PostRepo();

  PostCubit() : super(PostInitial());

  void getPostsList({String? id}) async {
    late List<Post> listPosts;
    emit(PostLoading());

    listPosts = await _postRepo.getPostsList();

    emit(PostsListLoaded(listPosts));
  }

  void getPost({String? id}) async {
    late Post post;
    emit(PostLoading());

    post = await _postRepo.getPost(id: id);

    emit(PostLoaded(post));
  }
}
