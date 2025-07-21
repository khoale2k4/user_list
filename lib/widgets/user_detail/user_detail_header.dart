import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:user_list/models/user_model.dart';

class UserDetailHeader extends StatelessWidget {
  final User user;
  final Animation<double> scaleAnimation;
  final VoidCallback onShare;

  const UserDetailHeader({
    super.key,
    required this.user,
    required this.scaleAnimation,
    required this.onShare,
  });

  Widget _buildActionButton(BuildContext context,
      {required IconData icon, required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black87),
        onPressed: () {
          HapticFeedback.lightImpact();
          onPressed();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280,
      pinned: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      elevation: 0,
      leading: _buildActionButton(
        context,
        icon: Icons.arrow_back,
        onPressed: () => context.goNamed('userList'),
      ),
      actions: [
        _buildActionButton(
          context,
          icon: Icons.share,
          onPressed: onShare,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue.shade400,
              Colors.blue.shade600,
              Colors.blue.shade800
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Center(
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Hero(
                    tag: "avatar_${user.id}",
                    child: CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(user.avatar),
                        onBackgroundImageError: (_, __) {},
                        child: ClipOval(
                          child: Image.asset(
                            'lib/assets/images/user.png',
                            fit: BoxFit.cover,
                            width: 128,
                            height: 128,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${user.first_name} ${user.last_name}',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 4)
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
