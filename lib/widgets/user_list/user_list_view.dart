import 'package:flutter/material.dart';
import 'package:user_list/models/user_model.dart';
import 'user_list_item.dart';
import 'load_more_button.dart';

class UserListView extends StatelessWidget {
  final ScrollController scrollController;
  final List<User> users;
  final bool isLoadingMore;
  final int currentPage;
  final Future<void> Function() onRefresh;
  final Function(int) onLoadMore;
  final Function(User) onUserTap;

  const UserListView({
    super.key,
    required this.scrollController,
    required this.users,
    required this.isLoadingMore,
    required this.currentPage,
    required this.onRefresh,
    required this.onLoadMore,
    required this.onUserTap,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: Colors.blue,
      child: CustomScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return UserListItem(
                    user: users[index],
                    index: index,
                    onTap: () => onUserTap(users[index]),
                  );
                },
                childCount: users.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: LoadMoreButton(
              isLoading: isLoadingMore,
              onPressed: () => onLoadMore(currentPage),
            ),
          ),
        ],
      ),
    );
  }
}