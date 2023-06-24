import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/repository/comment_repository.dart';
import 'package:flutter_tutorial/ui/comments/cubit/comment_cubit.dart';
import 'package:flutter_tutorial/ui/comments/cubit/comment_state.dart';

class CommentsPage extends StatefulWidget {
  static const String routeName = '/CommentsPage';

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  final _scrollController = ScrollController();
  final _scrollThreadHold = 250.0;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<CommentCubit>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cubit.fetchComments();
    });

    // _scrollController.addListener(() {
    //   final maxScrollExtent = _scrollController.position.maxScrollExtent;
    //   final currentScroll = _scrollController.position.pixels;
    //
    //   if (maxScrollExtent - currentScroll <= _scrollThreadHold) {
    //     cubit.fetchComments();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    getCommentsFromApi(0, 20);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comment List'),
      ),
      body: BlocBuilder<CommentCubit, CommentState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case InitCommentState:
            case LoadingCommentState:
              return Center(child: CircularProgressIndicator());
            case ResponseCommentState:
              final comments = (state as ResponseCommentState).comments;
              return ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    return ListTile(
                      leading: Text('${index + 1}'),
                      title: Text(
                        comment.name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      isThreeLine: true,
                      subtitle: Text(
                        comment.body,
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  });
            case ErrorCommentState:
              final message = (state as ErrorCommentState).message;
              return Center(child: Text(message));
            default:
              return Center(child: Text(state.toString()));
          }
        },
      ),
    );
  }
}
