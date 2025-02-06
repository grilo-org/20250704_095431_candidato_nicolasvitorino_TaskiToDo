import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taski_todo/data/models/user.dart';
import 'package:taski_todo/data/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<LoadUser>(_loadUser);
    on<UpdateUser>(_updateUser);
  }

  void _loadUser(LoadUser event, Emitter<UserState> emit) {
    emit(UserLoading());
    try {
      final user = userRepository.getUser();
      if (user != null) {
        emit(UserLoaded(user));
      } else {
        emit(
            UserInitial()); // Se não houver usuário salvo, mantém estado inicial
      }
    } catch (e) {
      emit(UserError("Erro ao carregar usuário: $e"));
    }
  }

  Future<void> _updateUser(UpdateUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      await userRepository.saveUser(event.user);
      emit(UserLoaded(event.user));
    } catch (e) {
      emit(UserError("Erro ao atualizar usuário: $e"));
    }
  }
}
