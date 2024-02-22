import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              const Text(
                'Guivana',
                style: TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.w900,
                  fontSize: 35, 
                ),
              ),
              const Text(
                ' 3',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w900,
                  fontSize: 35,
                ),
              ),
              const Spacer(), 
              
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                color: Colors.white,
                style: ButtonStyle(
                  iconSize: MaterialStateProperty.all(35),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
