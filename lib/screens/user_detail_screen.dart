import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/blocs/users/user_bloc.dart';
import 'package:user_list/blocs/users/user_event.dart';
import 'package:user_list/blocs/users/user_state.dart';
import '../widgets/user_detail/user_detail_content.dart';
import '../widgets/share/loading_view.dart';
import '../widgets/share/error_view.dart';

class UserDetailScreen extends StatefulWidget {
  final String userId;

  const UserDetailScreen({super.key, required this.userId});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> with TickerProviderStateMixin {
  late final AnimationController _slideController;
  late final AnimationController _fadeController;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    context.read<UserBloc>().add(FetchUserDetail(widget.userId));
    _fadeController.forward();
    _slideController.forward();
  }
  
  void _setupAnimations() {
    _slideController = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    _fadeController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut));

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0)
        .animate(CurvedAnimation(parent: _slideController, curve: Curves.elasticOut));
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _retryFetch() {
    HapticFeedback.lightImpact();
    context.read<UserBloc>().add(FetchUserDetail(widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _buildBodyForState(state),
          );
        },
      ),
    );
  }

  Widget _buildBodyForState(UserState state) {
    if (state is UserLoading) {
      return LoadingView(key: const ValueKey('loading'));
    } 
    if (state is UserDetailLoaded) {
      return UserDetailContent(
        key: ValueKey('loaded_${state.user.id}'),
        user: state.user,
        slideAnimation: _slideAnimation,
        fadeAnimation: _fadeAnimation,
        scaleAnimation: _scaleAnimation,
      );
    } 
    if (state is UserError) {
      return ErrorView(
        key: const ValueKey('error'),
        message: state.message,
        onRetry: _retryFetch,
      );
    }
    return const SizedBox.shrink(key: ValueKey('initial'));
  }
}