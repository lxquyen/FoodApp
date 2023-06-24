import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/ui/comments/cubit/comment_state.dart';
import '../../../repository/comment_repository.dart';

class CommentCubit extends Cubit<CommentState> {
  final CommentRepository _repository;

  CommentCubit(this._repository) : super(InitCommentState());

  Future<void> fetchComments() async {
    emit(LoadingCommentState());
    try {
      final response = await _repository.getCommentsFromApi(0, 20);
      emit(ResponseCommentState(response));
    } catch (e) {
      emit(ErrorCommentState(e.toString()));
    }
  }
}
