import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900], 
      body: const _HomeView(),
    ); 
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers:[
        SliverAppBar(
          backgroundColor: Colors.blueGrey[900],
          floating: true,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('Home'),
          ),
        ),
      ],
    ); 
  }
} 