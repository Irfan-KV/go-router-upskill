// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// This sample app shows an app with two screens.
///
/// The first route '/' is mapped to [HomeScreen], and the second route
/// '/details' is mapped to [DetailsScreen].
///
/// The buttons use context.go() to navigate to each destination. On mobile
/// devices, each destination is deep-linkable and on the web, can be navigated
/// to using the address bar.
void main() => runApp(const MyApp());

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// The home screen
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: null,
          child: const Text('Go to the Details screen'),
        ),
      ),
    );
  }
}

/// The details screen
class DetailsScreen extends StatelessWidget {
  final String id;
  final String name;

  /// Constructs a [DetailsScreen]
  const DetailsScreen({required this.id, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$id: $name')),
      body: Center(
        child: ElevatedButton(
          onPressed: null,
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}

class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  /// The widget to display in the body of the Scaffold.
  /// In this sample, it is a Navigator.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'A Screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'B Screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_rounded),
            label: 'C Screen',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/a')) {
      return 0;
    }
    if (location.startsWith('/b')) {
      return 1;
    }
    if (location.startsWith('/c')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/a');
      case 1:
        context.go('/b');
      case 2:
        context.go('/c');
    }
  }
}

class ErrorScreen extends StatelessWidget {
  /// Constructs a [Screen]
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/');
          },
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}

class ScreenA extends StatelessWidget {
  /// Constructs a [ScreenA] widget.
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Screen A'),
            TextButton(
              onPressed: null,
              child: const Text('View A details'),
            ),
          ],
        ),
      ),
    );
  }
}

/// The second screen in the bottom navigation bar.
class ScreenB extends StatelessWidget {
  /// Constructs a [ScreenB] widget.
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Screen B'),
            TextButton(
              onPressed: null,
              child: const Text('View B details'),
            ),
          ],
        ),
      ),
    );
  }
}

/// The third screen in the bottom navigation bar.
class ScreenC extends StatelessWidget {
  /// Constructs a [ScreenC] widget.
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Screen C'),
            TextButton(
              onPressed: null,
              child: const Text('View C details'),
            ),
          ],
        ),
      ),
    );
  }
}
