import 'package:flutter/material.dart';
import 'package:user_list/models/user_model.dart';
import 'user_info_tile.dart';

class UserInfoCard extends StatelessWidget {
  final User user;
  final VoidCallback onEmailTap;

  const UserInfoCard({
    super.key,
    required this.user,
    required this.onEmailTap,
  });
  
  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 1,
      color: Colors.grey.shade200,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [ BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, 8)) ],
      ),
      child: Column(
        children: [
          UserInfoTile(
            icon: Icons.email_outlined,
            title: 'Email',
            value: user.email,
            onTap: onEmailTap,
          ),
          _buildDivider(),
          UserInfoTile(
            icon: Icons.person_outline,
            title: 'Họ tên',
            value: '${user.first_name} ${user.last_name}',
          ),
          _buildDivider(),
          UserInfoTile(
            icon: Icons.badge_outlined,
            title: 'ID',
            value: '#${user.id}',
          ),
        ],
      ),
    );
  }
}