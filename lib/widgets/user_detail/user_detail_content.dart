import 'package:flutter/material.dart';
import 'package:user_list/models/user_model.dart';
import 'user_detail_header.dart';
import 'user_info_card.dart';

class UserDetailContent extends StatelessWidget {
  final User user; 
  final Animation<Offset> slideAnimation;
  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;

  const UserDetailContent({
    super.key,
    required this.user,
    required this.slideAnimation,
    required this.fadeAnimation,
    required this.scaleAnimation,
  });
  
  void _showShareOptions(BuildContext context) { /* ... Logic show modal ... */ }
  void _launchEmail(BuildContext context, String email) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Mở email: $email')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        UserDetailHeader(
          user: user,
          scaleAnimation: scaleAnimation,
          onShare: () => _showShareOptions(context),
        ),
        SliverToBoxAdapter(
          child: SlideTransition(
            position: slideAnimation,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: UserInfoCard(
                  user: user,
                  onEmailTap: () => _launchEmail(context, user.email),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}