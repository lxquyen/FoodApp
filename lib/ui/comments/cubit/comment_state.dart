import 'package:flutter_tutorial/models/comment.dart';

abstract class CommentState {}

class InitCommentState extends CommentState {}

class LoadingCommentState extends CommentState {}

class ErrorCommentState extends CommentState {
  final String message;

  ErrorCommentState(this.message);
}

class ResponseCommentState extends CommentState {
  List<Comment> comments;

  ResponseCommentState(this.comments);
}
