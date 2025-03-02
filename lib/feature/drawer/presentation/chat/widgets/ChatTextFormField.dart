import 'package:flutter/material.dart';

class ChattextFormField extends StatelessWidget {
  TextEditingController messageController= TextEditingController();
  Function fun;

  ChattextFormField(this.messageController,this.fun,{super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController=ScrollController();
    return Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(26)
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: messageController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                ),

                              ),
                            ),
                            Container(
                              height: 60,
                              color: Color(0xffce0058),
                              child: MaterialButton( onPressed: ()async {
                               await fun();
                                // scrollController.animateTo(
                                //   scrollController.position.maxScrollExtent,
                                //   duration: Duration(milliseconds: 500),
                                //   curve: Curves.fastOutSlowIn,
                                // );
                                messageController.clear();
                              },
                                minWidth: 1.0,
                                child: Container(
                                  child: Icon(Icons.send,size: 16,color: Colors.white,)),),
                            )
                          ],
                        ),
                      );
  }
}