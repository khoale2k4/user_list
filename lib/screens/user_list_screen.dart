import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_list/blocs/users/user_bloc.dart';
import 'package:user_list/blocs/users/user_event.dart';
import 'package:user_list/blocs/users/user_state.dart';
import 'package:user_list/widgets/share/error_view.dart';
import 'package:user_list/widgets/share/loading_view.dart';
import 'package:user_list/widgets/user_list/user_list_app_bar.dart';
import 'package:user_list/widgets/user_list/user_list_view.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (context.read<UserBloc>().state is! UserLoaded) {
      context.read<UserBloc>().add(FetchUserList());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    context.read<UserBloc>().add(FetchUserList());
  }

  void _onLoadMore(int currentPage) {
    context.read<UserBloc>().add(FetchUserList(page: currentPage + 1));
  }

  void _onUserTap(dynamic user) {
    context.goNamed('userDetail', pathParameters: {'id': user.id.toString()});
  }

  void _onRetry() {
    context.read<UserBloc>().add(FetchUserList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const UserListAppBar(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading && state is! UserLoaded) {
            return const LoadingView();
          }
          if (state is UserLoaded) {
            return UserListView(
              scrollController: _scrollController,
              users: state.users,
              isLoadingMore: state.adding,
              currentPage: state.page,
              onRefresh: _onRefresh,
              onLoadMore: _onLoadMore,
              onUserTap: _onUserTap,
            );
          }
          if (state is UserError) {
            return ErrorView(message: state.message, onRetry: _onRetry);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}