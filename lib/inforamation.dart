import 'package:flutter/material.dart';
import 'package:motatlabat/resources.dart';

class InforamationScreen extends StatelessWidget {
  InforamationScreen({Key key}) : super(key: key);
  TextStyle _styleOfInformation = new TextStyle(
    color: questionsColor,
    fontSize: 20,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueLikeColor,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(60)),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'تعليمات',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: sideWide),
                      ),
                      Text(
                        '1.في حال كان هناك أي تعديل لاجابة يرجى التواصل معنا للتعديل.',
                        style: _styleOfInformation,
                      ),
                      Text(
                          ' 2. في حال تمكنك من حل الأسئلة غير المجابة بإمكانك إرسال الحل ليتم إضافتها',
                          style: _styleOfInformation),
                      Text(
                          'ان كان معك أسئلة ليست موجودة بالتطبيق يمكنك ارسالها ولك الأجر ان شاء الله',
                          style: _styleOfInformation),
                      Text('4.لاي اسفسار او اضافة او اقتراح تواصل معنا',
                          style: _styleOfInformation),
                      Text(
                        '5.التواصل عن طريق واتس أب أو تلي غرام',
                        style: _styleOfInformation,
                      ),
                      Text(
                        'لا تنسى تقيمنا عمتجر بلاي',
                        style: _styleOfInformation,
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
