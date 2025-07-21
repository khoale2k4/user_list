import 'package:flutter/material.dart';

class UserListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      foregroundColor: Colors.black87,
      title: const Text('Danh sách người dùng', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [ Colors.grey.shade200, Colors.grey.shade300, Colors.grey.shade200 ]),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}