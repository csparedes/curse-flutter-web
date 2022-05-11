import 'package:admin_web_movil/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  const DashboardLayout({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedf1f2),
      body: Row(
        children: [
          const SideBar(),
          Expanded(
            child: Column(
              children: [
                Expanded(child: child),
              ],
            ),
          )
        ],
      ),
    );
  }
}
