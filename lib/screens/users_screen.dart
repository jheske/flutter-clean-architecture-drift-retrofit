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

// This class represents the UsersScreen, which is a StatefulWidget used to display
// a list of users. It contains a Scaffold with an AppBar and body content to show
// the list of users fetched from the repository.

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key}); // Constructor for UsersScreen.

  @override
  State createState() => _UsersScreenState(); // Create state for UsersScreen.
}

// State class for UsersScreen.
class _UsersScreenState extends State<UsersScreen> {
  // Repository instance obtained from the service locator.
  final repository = serviceLocator.get<Repository>();

  // Build method to construct the UI for UsersScreen.
  @override
  Widget build(BuildContext context) {
    // Return Scaffold widget with AppBar and body content.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'), // Set app bar title.
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back arrow icon.
          onPressed: () {
            GoRouter.of(context).pop(); // Navigate back when the back arrow button is pressed.
          },
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('My Users'), // Display title.
          ),
          Expanded(
            child: Center(
              child: FutureBuilder<List<UserEntity>>(
                future: repository.getUsers(), // Fetch list of users asynchronously.
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Show loading indicator while waiting for data.
                  } else {
                    if (snapshot.hasError) {
                      return Text(
                          'Error: ${snapshot.error}'); // Show error message if data fetching fails.
                    } else {
                      final users = snapshot.data!; // Get list of users.
                      return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index]; // Get current user.
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Provider.of<UserEntity>(context, listen: false)
                                    .setUser(user); // Set selected user using Provider.
                                GoRouter.of(context).push(
                                    '/user/${user.id}/${user.username}'); // Navigate to user details screen.
                              },
                              child: Text(user.username), // Display user username on button.
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
