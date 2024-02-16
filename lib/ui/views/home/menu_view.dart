import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chucnang').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(); // Hiển thị tiến trình khi dữ liệu đang được tải
          }
          return ListView(
            padding: EdgeInsets.zero,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['tenHienThi']),
                onTap: () {
                  // Thực hiện hành động khi người dùng chọn một chức năng trong Drawer
                  // Ví dụ: Navigator.push() để điều hướng đến màn hình tương ứng
                  Navigator.pop(context); // Đóng Drawer
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
