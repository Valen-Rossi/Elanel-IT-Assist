import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:elanel_asistencia_it/presentation/widgets/widgets.dart';
import 'package:elanel_asistencia_it/domain/entities/user.dart';
import 'package:elanel_asistencia_it/presentation/providers/providers.dart';
import 'package:go_router/go_router.dart';

class UsersView extends ConsumerStatefulWidget {
  static const name = 'users-view';

  const UsersView({super.key});

  @override
  ConsumerState<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends ConsumerState<UsersView> {
  @override
  void initState() {
    super.initState();
    ref.read(usersProvider.notifier).loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(filteredUsersProvider);
    final filters = ref.watch(userFilterProvider);
    final filterNotifier = ref.read(userFilterProvider.notifier);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/new-user');
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add)
      ),
      appBar: AppBar(
        title: Text(
          'Usuarios',
          style: TextStyle(
            color: colors.primary,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => filterNotifier.state = UserFilterState.empty,
            child: const Text('Limpiar filtros'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: CustomDropdownFormField<UserRole?>(
                    label: 'Rol de usuario',
                    value: filters.role,
                    items: [
                      const DropdownMenuItem(value: null, child: Text('Todos')),
                      ...UserRole.values.map(
                        (role) => DropdownMenuItem(
                          value: role,
                          child: Text(role.label),
                        ),
                      ),
                    ],
                    onChanged: (role) => filterNotifier.state =
                        filterNotifier.state.copyWith(role: role),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: users.isEmpty
                ? Center(
                    child: Text(
                      'No se encontraron usuarios.',
                      style: TextStyle(color: colors.onSurfaceVariant),
                    ),
                  )
                : ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) =>
                        UserCard(user: users[index]),
                  ),
          ),
        ],
      ),
    );
  }
}
