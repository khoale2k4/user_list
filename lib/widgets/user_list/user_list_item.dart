import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_list/models/user_model.dart';

class UserListItem extends StatelessWidget {
  final User user;
  final int index;
  final VoidCallback onTap;

  const UserListItem({
    super.key,
    required this.user,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(
          milliseconds: 300 +
              (index % 10 * 80)), // Giới hạn index để animation không quá chậm
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.08),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              HapticFeedback.lightImpact();
              onTap();
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Hero(
                    tag: "avatar_${user.id}",
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(user.avatar),
                      backgroundColor: Colors.grey.shade100,
                      onBackgroundImageError: (_, __) {},
                      child: ClipOval(
                        child: Image.asset(
                          'lib/assets/images/user.png',
                          fit: BoxFit.cover,
                          width: 56,
                          height: 56,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${user.first_name} ${user.last_name}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user.email,
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 16, color: Colors.grey.shade400),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
