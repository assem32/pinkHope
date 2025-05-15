import 'package:breastnew/core/AppRouter.dart';
import 'package:breastnew/core/constant.dart';
import 'package:breastnew/feature/auth/data/models/UserModel.dart';
import 'package:breastnew/feature/drawer/presentation/chat/Chat.dart';
import 'package:flutter/material.dart';

class DoctorsListView extends StatelessWidget {
  List<UserModel> list;
  var context;
  DoctorsListView(this.list,this.context, {super.key});

  @override
  Widget build(context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder:
          (context, index) => InkWell(
            onTap: () {
              AppRouter.router.push("/login/home/doctos/chat/${list[index].uid}");
            },
            child: Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(doctorImg)),
                SizedBox(width: 12),
                Text('${list[index].name}'),
              ],
            ),
          ),
      separatorBuilder: (context, state) => SizedBox(height: 10),
      itemCount: list.length,
    );
  }
}
