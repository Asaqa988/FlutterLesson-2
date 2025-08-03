// منستورد مكتبة Flutter الرئيسية لبناء الواجهة والتعامل مع العناصر
import 'package:flutter/material.dart';

/// هاي الصفحة اسمها StudentManagementPage
/// هدفها إنها تعطي المستخدم واجهة يضيف فيها طلاب، يعدّل عليهم، يبحث عنهم، أو يحذفهم
class StudentManagementPage extends StatefulWidget {
  // هون بنستقبل قائمة الطلاب (globalStudents) من الشاشة الرئيسية
  final List<String> globalStudents;

  // كونستركتر الصفحة، لازم يستقبل لستة الطلاب
  const StudentManagementPage({super.key, required this.globalStudents});

  @override
  State<StudentManagementPage> createState() => _StudentManagementPageState();
}

/// هاي الكلاس بتحتوي كل الحالة المنطقية والسلوكيات للشاشة (State)
class _StudentManagementPageState extends State<StudentManagementPage> {
  // كنترولر لتيكست فيلد تبع إدخال اسم الطالب
  final TextEditingController _controller = TextEditingController();

  // كنترولر لحقل البحث
  final TextEditingController _searchController = TextEditingController();

  // متغيّر بنخزن فيه القيمة اللي المستخدم كتبها في البحث
  String searchQuery = '';

  // إذا المستخدم عم يعدّل اسم طالب، بنحفظ رقم السطر اللي عم يتعدّل
  int? editingIndex;

  /// Getter بترجع قائمة الطلاب بعد الفلترة حسب البحث
  /// إذا المستخدم مش كاتب إشي في البحث، بنعرض كل الطلاب
  List<String> get filteredStudents {
    if (searchQuery.isEmpty) return widget.globalStudents;
    return widget.globalStudents
        .where(
          (student) =>
              student.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }

  /// هاي الفنكشن بتشتغل لما المستخدم يضغط "Add" أو "Update"
  void _addOrUpdateStudent() {
    final name = _controller.text
        .trim(); // منجيب الاسم من حقل النص ونشيله المسافات

    if (name.isEmpty) return; // إذا الحقل فاضي، ما منعمل إشي

    setState(() {
      if (editingIndex != null) {
        // إذا كنا بنعدّل طالب، منحدّث الاسم بالمكان المناسب
        widget.globalStudents[editingIndex!] = name;
        editingIndex = null; // منرجع الوضع لطبيعتو
      } else if (!widget.globalStudents.contains(name)) {
        // إذا اسم جديد وما بيتكرر، منضيفه للقائمة
        widget.globalStudents.add(name);
      }

      _controller.clear(); // منفضي الحقل بعد الإضافة/التعديل
    });
  }

  /// هاي الفنكشن بتحذف طالب من القائمة
  void _deleteStudent(int index) {
    setState(() {
      // لازم نعرف الرقم الحقيقي للطالب في القائمة الأصلية
      final realIndex = widget.globalStudents.indexOf(filteredStudents[index]);
      widget.globalStudents.removeAt(realIndex); // حذف من القائمة
    });
  }

  /// هاي بتجهّز الطالب للتعديل (بتعبّي اسمه في حقل النص)
  void _editStudent(int index) {
    final realIndex = widget.globalStudents.indexOf(filteredStudents[index]);

    _controller.text =
        widget.globalStudents[realIndex]; // نعرض الاسم في حقل النص

    setState(() {
      editingIndex = realIndex; // نخزن رقم السطر اللي بنعدّله
    });
  }

  /// هون منبني واجهة المستخدم الكاملة
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Students"), // عنوان الشريط العلوي
        backgroundColor: Colors.blue, // لون الشريط
      ),
      body: Padding(
        padding: const EdgeInsets.all(16), // حشوة داخلية للمحتوى
        child: Column(
          children: [
            // ================== 🔍 حقل البحث ==================
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Students', // نص ظاهر داخل الحقل
                prefixIcon: Icon(Icons.search), // أيقونة بحث داخل الحقل
                border: OutlineInputBorder(), // حواف مربعة للحقل
              ),
              // كل مرة المستخدم يكتب فيها، منحدّث قيمة البحث ومنعيد بناء الواجهة
              onChanged: (value) => setState(() => searchQuery = value),
            ),

            SizedBox(height: 10),

            // ================== 🧑 حقل إدخال اسم الطالب ==================
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                // إذا عم نعدّل طالب، بنغيّر النص الظاهر
                labelText: editingIndex != null ? 'Edit Name' : 'Student Name',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            // ================== زر الإضافة أو التحديث ➕ ==================
            ElevatedButton(
              onPressed: _addOrUpdateStudent, // بنفذ الدالة حسب الوضع الحالي
              child: Text(editingIndex != null ? "Update" : "Add Student"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),

            SizedBox(height: 20),

            // ================== 👥 عرض الطلاب ==================
            Expanded(
              child: ListView.builder(
                itemCount: filteredStudents.length, // بنعرض الطلاب بعد الفلترة
                itemBuilder: (context, index) {
                  final student = filteredStudents[index];

                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(student[0]), // أول حرف من اسم الطالب
                    ),
                    title: Text(student), // اسم الطالب كامل
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ✏️ زر التعديل
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.orange),
                          onPressed: () => _editStudent(index),
                        ),

                        // 🗑️ زر الحذف
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteStudent(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
