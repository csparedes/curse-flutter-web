import 'package:admin_web_movil/ui/shared/widgets/logo.dart';
import 'package:admin_web_movil/ui/shared/widgets/menu_item.dart';
import 'package:admin_web_movil/ui/shared/widgets/text_separated.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      decoration: _buildDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(height: 20),
          TextSeparator(text: 'main'),
          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            onPressed: () {},
            // isActive: true,
          ),
          MenuItem(
            text: 'Orders',
            icon: Icons.shopping_cart_checkout_outlined,
            onPressed: () {},
            // isActive: true,
          ),
          MenuItem(
            text: 'Analytics',
            icon: Icons.show_chart_outlined,
            onPressed: () {},
            // isActive: true,
          ),
          MenuItem(
            text: 'Categories',
            icon: Icons.layers_outlined,
            onPressed: () {},
            // isActive: true,
          ),
          MenuItem(
            text: 'Products',
            icon: Icons.dashboard_outlined,
            onPressed: () {},
            // isActive: true,
          ),
          MenuItem(
            text: 'Discount',
            icon: Icons.attach_money_outlined,
            onPressed: () {},
            // isActive: true,
          ),
          MenuItem(
            text: 'Customers',
            icon: Icons.people_alt_outlined,
            onPressed: () {},
            // isActive: true,
          ),
          const SizedBox(height: 30),
          const TextSeparator(text: 'UI Elements'),
          MenuItem(
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            onPressed: () {},
            // isActive: true,
          ),
          MenuItem(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            onPressed: () {},
            // isActive: true,
          ),
          MenuItem(
            text: 'Campaign',
            icon: Icons.note_add_outlined,
            onPressed: () {},
            // isActive: true,
          ),
          MenuItem(
            text: 'Black',
            icon: Icons.post_add_outlined,
            onPressed: () {},
            // isActive: true,
          ),
          MenuItem(
            text: 'Logout',
            icon: Icons.exit_to_app_outlined,
            onPressed: () {},
            // isActive: true,
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xff092044),
          Color(0xff092042),
        ],
      ),
      boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 10),
      ],
    );
  }
}
