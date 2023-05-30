import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class NotificationScreen extends StatefulWidget {
  final String payloud;
  const NotificationScreen({Key? key,required this.payloud}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payloud='';
  @override
  void initState() {
    super.initState();
    _payloud=widget.payloud;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.back(),
        icon: const Icon(Icons.arrow_back_ios),
        color: Get.isDarkMode ? Colors.white : darkGreyClr,),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        title: Text(
          _payloud.toString().split('|')[0],
          style:  TextStyle(color:Get.isDarkMode?Colors.white: darkGreyClr),
        ),
      ),
      body: Container(
        child: SafeArea(

          child: Column(

            children:  [
              const SizedBox(height: 20,),
             Column(
               children: [
                 Text("Hello, Nour",style: TextStyle(
                   fontSize: 26,
                   fontWeight: FontWeight.w900,
                   color: Get.isDarkMode?Colors.white: darkGreyClr,
                 ),),
                 SizedBox(height: 10,),
                 Text("You have anew remainder",style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.w300,
                   color: Get.isDarkMode?Colors.grey[100]: darkGreyClr,
                 ),),
               ],
             ),
              const SizedBox(height: 10,),
                Expanded(child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: primaryClr,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.text_format,size: 35,color: Colors.white,),
                            SizedBox(width: 20,),
                            Text("Title",style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),)
                          ],

                        ),
                        const SizedBox(height: 20,),
                        Text(_payloud.toString().split('|')[0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                        const SizedBox(height: 20,),
                        Row(
                          children: const [
                            Icon(Icons.description,size: 35,color: Colors.white,),
                            SizedBox(width: 20,),
                            Text("Description",style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),)
                          ],

                        ),
                        const SizedBox(height: 20,),
                        Text(_payloud.toString().split('|')[1],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        textAlign: TextAlign.justify,),
                        const SizedBox(height: 20,),
                        Row(
                          children: const [
                            Icon(Icons.calendar_today_outlined,size: 35,color: Colors.white,),
                            SizedBox(width: 20,),
                            Text("Date",style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),)
                          ],

                        ),
                        const SizedBox(height: 20,),
                        Text(_payloud.toString().split('|')[2],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),

                      ],
                    ),
                  ),
                )),
              const SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}
