part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

// Carrega os dados do usuário salvo no Hive
class LoadUser extends UserEvent {}

// Atualiza os dados do usuário (nome e foto)
class UpdateUser extends UserEvent {
  final UserModel user;

  const UpdateUser(this.user);

  @override
  List<Object> get props => [user];
}
