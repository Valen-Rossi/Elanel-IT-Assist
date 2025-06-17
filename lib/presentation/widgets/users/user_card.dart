import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:elanel_asistencia_it/domain/entities/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Material(
        color: colors.onInverseSurface,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () => context.push('/user/${user.id}'),
          highlightColor: colors.primary.withAlpha(70),
          splashColor: colors.primary.withAlpha(50),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
            child: Row(
              children: [

                Icon(
                  user.role.icon,
                  color: colors.primary,
                ),
                
                SizedBox(width: 17),

                Expanded(
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text("ID: ${user.id}")
                  
                    ],
                  ),
                ),

                SizedBox(width: 5),

                Text(
                  user.role.label,
                  
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}