part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

// Estado inicial antes de carregar os dados
class UserInitial extends UserState {}

// Estado de carregamento
class UserLoading extends UserState {}

// Estado quando o usuário é carregado com sucesso
class UserLoaded extends UserState {
  final UserModel user;

  const UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

// Estado de erro
class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object> get props => [message];
}
