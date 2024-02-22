/// Copyright (C) 2024 Jill Heske
/// This file is part of flutter-clean-architecture-drift-retrofit.
///
/// flutter-clean-architecture-drift-retrofit is free software: you can redistribute it and/or modify
/// it under the terms of the Apache License, Version 2.0, as published by
/// the Apache Software Foundation.
///
/// flutter-clean-architecture-drift-retrofit is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
/// Apache License, Version 2.0 for more details.
///
/// You should have received a copy of the Apache License, Version 2.0
/// along with flutter-clean-architecture-drift-retrofit. If not, see <https:///www.apache.org/licenses/LICENSE-2.0>.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/di/injection_container.dart';
import '../data/domain/entity/user_entity.dart';
import '../data/repository/music_repository.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final repository = serviceLocator.get<Repository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('My Users'),
          ),
          Expanded(
            child: Center(
              child: FutureBuilder<List<UserEntity>>(
                future: repository.getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final users = snapshot.data!;
                      return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Provider.of<UserEntity>(context, listen: false).setUser(user);
                                GoRouter.of(context).push('/user/${user.id}/${user.username}');
                              },
                              child: Text(user.username),
                            ),
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
