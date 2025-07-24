import 'package:flutter/material.dart';
import 'package:user_list/themes/theme.dart';

class TestLayout extends StatelessWidget {
  const TestLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<MyCustomThemeExtension>()!;

    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            // Một AppBar có thể cuộn và thu nhỏ
            SliverAppBar(
              pinned: true, // Giữ AppBar ở trên cùng khi cuộn
              expandedHeight: 400.0, // Chiều cao ban đầu khi mở rộng
              flexibleSpace: FlexibleSpaceBar(
                title: 
                // Image.network(
                //   'https://www.shutterstock.com/image-photo/rocky-shore-beach-andaman-sea-600w-310965713.jpg',
                //   fit: BoxFit.cover,
                // ),
                Text('My App Bar'),
                background: Image.network(
                  'https://www.shutterstock.com/image-photo/rocky-shore-beach-andaman-sea-600w-310965713.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Một khoảng trống giữa AppBar và danh sách
            SliverPadding(
              padding: EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Đây là một đoạn text thông thường trong Sliver.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            // Một lưới các item
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 cột
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final item = Center(child: Text('Item ${index + 1}'));
                  return Container(
                    key: item.key,
                    color: Colors.teal[100 * (index % 9)],
                    child: item,
                  );
                },
                childCount: 10,
              ),
            ),
            // Một danh sách các item
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: ListTile(
                      title: Text('List Item ${index + 1}'),
                      subtitle: Text('This is a list item.'),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
            // Lấp đầy phần còn lại
            SliverFillRemaining(
              child: Container(
                color: customTheme.brandColor,
                child: Center(
                  child: Text('Hết danh sách rồi!', style: TextStyle(color: customTheme.textColor),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
