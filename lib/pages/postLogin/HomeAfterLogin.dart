// استوردنا مكتبة الفلاتر الأساسية اللي بتحتوي على كل الودجتات
import 'package:flutter/material.dart';

// استوردنا صفحتين من المشروع: وحدة لإدارة الطلاب، والثانية لإدارة المحاضرات
import 'package:myapploginandsignup/pages/postLogin/StudentManagementPage.dart';
import 'package:myapploginandsignup/pages/postLogin/lecture_managment_page.dart';

// هاي الكلاس هي الواجهة الرئيسية بعد ما المستخدم يعمل تسجيل دخول
class HomeAfterLogin extends StatefulWidget {
  @override
  _HomeAfterLoginState createState() => _HomeAfterLoginState();
}

class _HomeAfterLoginState extends State<HomeAfterLogin> {
  // هاي القائمة رح نخزن فيها كل أسماء الطلاب، ورح نستخدمها بكل مكان زي المحاضرات والطلاب
  List<String> globalStudents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // هون بنبني الـ AppBar (الشريط العلوي)
      appBar: AppBar(
        title: Text("Dashboard"), // عنوان الصفحة
        backgroundColor: Colors.cyanAccent, // لون خلفية الشريط العلوي
      ),
      body: Center(
        // حطينا المحتوى بالنص
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // خلى العناصر بالنص عموديًا
          children: [
            // أول زر لإدارة الطلاب
            ElevatedButton(
              onPressed: () async {
                // لما نضغط الزر، بنروح على صفحة إدارة الطلاب وبننتظر يرجعلنا لستة جديدة محدثة
                final updatedStudents = await Navigator.push<List<String>>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentManagementPage(
                      globalStudents: globalStudents,
                    ), // بنبعث اللستة الحالية
                  ),
                );

                // إذا رجعت لستة محدثة، بنحدث الـ globalStudents
                if (updatedStudents != null) {
                  setState(() {
                    globalStudents = updatedStudents;
                  });
                }
              },
              child: Text("Add/Manage Students!"), // نص الزر
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ), // حشوة داخلية للزر
                textStyle: TextStyle(fontSize: 20), // حجم الخط
                backgroundColor: Colors.blue, // لون الزر
              ),
            ),
            SizedBox(height: 20), // مسافة بين الزرين
            // الزر الثاني لإدارة المحاضرات
            ElevatedButton(
              onPressed: () {
                // بنروح على صفحة المحاضرات وبنمرر نفس لستة الطلاب
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LectureManagerPage(globalStudents: globalStudents),
                  ),
                );
              },
              child: Text("Add/Manage Lectures!"), // نص الزر
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                textStyle: TextStyle(fontSize: 20),
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
