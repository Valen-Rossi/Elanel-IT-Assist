import 'package:elanel_asistencia_it/domain/entities/user.dart';
import 'package:elanel_asistencia_it/presentation/providers/users/users_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final usersProvider = StateNotifierProvider<UsersNotifier, List<User>>((ref) {
  final repository = ref.watch(usersRepositoryProvider);
  return UsersNotifier(
    fetchUsers: repository.getUsers,
    addUser: repository.addUser,
    updateUser: repository.updateUser,
  );
});
typedef UserCallback = Future<List<User>> Function();
typedef AddUserCallback = Future<void> Function(User user);
typedef UserUpdateCallback = Future<void> Function(User user);

class UsersNotifier extends StateNotifier<List<User>> {
  bool isLoading = false;
  final UserCallback fetchUsers;
  final AddUserCallback addUser;
  final UserUpdateCallback updateUser;

  UsersNotifier({
    required this.fetchUsers,
    required this.addUser,
    required this.updateUser,
  }) : super([]);

  Future<void> loadUsers() async {

    if (isLoading) return;
    
    isLoading = true;
    
    final List<User> users = await fetchUsers();
    state.clear();
    state = [...users];
    
    isLoading = false;
  }

  Future<void> createUser(User user) async {
    if (isLoading) return;

    isLoading = true;

    await addUser(user);
    state = [user, ...state];

    isLoading = false;
  }

  Future<void> userUpdate(User updatedUser) async {
    if (isLoading) return;

    isLoading = true;

    await updateUser(updatedUser);
    state = [
      for (final user in state)
        if (user.id == updatedUser.id) updatedUser else user
    ];

    isLoading = false;
  }

}