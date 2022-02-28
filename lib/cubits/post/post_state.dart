import 'package:equatable/equatable.dart';

import '../../models/post.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostsListLoaded extends PostState {
  final List<Post> listPost;

  const PostsListLoaded(this.listPost);
}

class PostLoaded extends PostState {
  final Post post;

  const PostLoaded(this.post);
}

class PostErrorLoaded extends PostState {}
