import 'package:elanel_asistencia_it/presentation/providers/users/users_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elanel_asistencia_it/domain/entities/user.dart';

class UserFilterState {
  final UserRole? role;

  const UserFilterState({this.role});

  UserFilterState copyWith({UserRole? role}) {
    return UserFilterState(role: role);
  }

  static const empty = UserFilterState();
}

final userFilterProvider = StateProvider<UserFilterState>((ref) {
  return UserFilterState.empty;
});

final filteredUsersProvider = Provider<List<User>>((ref) {
  final filter = ref.watch(userFilterProvider);
  final users = ref.watch(usersProvider);

  return users.where((user) {
    if (filter.role != null && user.role != filter.role) return false;
    return true;
  }).toList();
});
