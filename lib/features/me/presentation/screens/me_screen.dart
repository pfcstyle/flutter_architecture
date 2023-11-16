import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/routes/app_route.dart';
import 'package:flutter_architecture/shared/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:flutter_architecture/shared/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MeScreen extends ConsumerWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Me"),
        ),
        body: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              onTap: () async {
                await ref.read(userLocalRepositoryProvider).deleteUser();
                // ignore: use_build_context_synchronously
                AutoRouter.of(context).pushAndPopUntil(
                  LoginRoute(),
                  predicate: (_) => false,
                );
              },
              child: CircleAvatar(
                child: Icon(
                  Icons.logout,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                ref.read(appThemeProvider.notifier).toggleTheme();
              },
              child: CircleAvatar(
                child: Icon(
                  Theme.of(context).brightness == Brightness.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            )
          ]),
        ));
  }
}
