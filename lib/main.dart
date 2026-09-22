import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/screens/home_page.dart';
import 'package:mobile/stores/app_store.dart';
import 'package:mobile/theme/app_theme.dart';

void main() {
  runApp(const MiniCatalogueApp());
}

class MiniCatalogueApp extends StatelessWidget {
  const MiniCatalogueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Catalogue',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: BlocProvider(
        create: (_) => AppStore()..init(),
        child: const HomePage(),
      ),
    );
  }
}