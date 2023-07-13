import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_bloc_event.dart';
part 'new_bloc_state.dart';

class NewBlocBloc extends Bloc<NewBlocEvent, NewBlocState> {
  NewBlocBloc() : super(NewBlocInitial()) {
    on<NewBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
