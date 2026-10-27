import 'package:flutter/material.dart';
import 'package:flowery_e_commerce/core/di/di.dart';
import 'package:flowery_e_commerce/core/storage/session_storage.dart';

import 'auth/domain/entities/user_entity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<UserEntity?> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = getIt<SessionStorage>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<UserEntity?>(
          future: _userFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            final user = snapshot.data;
            print(user?.photo);

            if (user == null) {
              return const Text('Welcome!');
            }

            return Column(
              children: [
            Text(
            'Welcome, ${user.firstName}!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
                Text(
                  'Welcome, ${user.email}!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Welcome, ${user.lastName}!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ClipOval(
                  child: Image.network(
                    user.photo,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.person, size: 100);
                    },
                  ),
                )
              ],
            );
          },
        ),
      )
    );
  }
}