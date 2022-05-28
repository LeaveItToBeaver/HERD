import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'liked_posts_state.dart';

class LikedPostsCubit extends Cubit<LikedPostsState> {
  LikedPostsCubit() : super(LikedPostsInitial());
}
