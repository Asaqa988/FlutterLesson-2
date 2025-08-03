// منستورد مكتبة فلاتر الأساسية عشان نستخدم الودجتات الخاصة ببناء الواجهة
import 'package:flutter/material.dart';

/// هذا الكلاس بيمثّل كائن محاضرة (Lecture)
/// فيه اسم المحاضرة، اسم المدرّس، الطلاب المسجلين فيها، والجدول الزمني للمحاضرة
class Lecture {
  String name; // اسم المحاضرة
  String teacher; // اسم المدرّس
  List<String> students; // قائمة الطلاب
  DateTime? schedule; // موعد المحاضرة (تاريخ ووقت)

  // هون بنعرف الكونستركتر للكائن، بنخلي الاسم والمدرس إجباريين، والباقي اختياري
  Lecture({
    required this.name,
    required this.teacher,
    this.students = const [], // القيمة الافتراضية: قائمة فاضية
    this.schedule, // ممكن تكون null إذا المستخدم ما حدد وقت
  });
}

/// هاي الصفحة اسمها LectureManagerPage وهي صفحة لإضافة وتعديل المحاضرات
/// وبتستقبل قائمة الطلاب الجايين من الصفحة الرئيسية (globalStudents)
class LectureManagerPage extends StatefulWidget {
  final List<String> globalStudents; // الطلاب الجاهزين للإضافة على المحاضرات

  const LectureManagerPage({Key? key, required this.globalStudents})
    : super(key: key);

  @override
  _LectureManagerPageState createState() => _LectureManagerPageState();
}

class _LectureManagerPageState extends State<LectureManagerPage> {
  List<Lecture> lectures = []; // هون بنخزن كل المحاضرات المضافة

  // قوائم جاهزة تحتوي أسماء محاضرات ومدرسين للاختيار منها
  final List<String> lectureNames = ['Math', 'Physics', 'Biology', 'Chemistry'];
  final List<String> teachers = [
    'Mr. Smith',
    'Ms. Johnson',
    'Dr. Lee',
    'Prof. Ahmed',
  ];

  // المتغيرات اللي بتخزن اختيارات المستخدم أثناء تعبئة النموذج
  String? selectedLectureName;
  String? selectedTeacher;
  String? selectedStudent;
  DateTime? selectedSchedule; // الموعد المحدد للمحاضرة
  List<String> currentStudents = []; // الطلاب المضافين للمحاضرة الحالية
  int? editingIndex; // إذا المستخدم بضغط "تعديل"، بنحفظ رقم المحاضرة

  /// هاي الدالة بترجع النموذج للوضع الابتدائي (تفريغ الاختيارات)
  void _resetForm() {
    selectedLectureName = null;
    selectedTeacher = null;
    selectedStudent = null;
    selectedSchedule = null;
    currentStudents = [];
    editingIndex = null;
  }

  /// بتضيف الطالب المختار على قائمة الطلاب للمحاضرة الحالية
  void _addStudent() {
    if (selectedStudent != null &&
        !currentStudents.contains(selectedStudent!)) {
      setState(() {
        currentStudents.add(selectedStudent!); // بنضيف الطالب
        selectedStudent = null; // ومنرجع نفضي الاختيار
      });
    }
  }

  /// بتخلي المستخدم يعدل اسم طالب من الطلاب الحاليين
  void _editStudent(int index) {
    setState(() {
      selectedStudent = currentStudents[index]; // بنعرض اسم الطالب عشان نعدله
      currentStudents.removeAt(index); // بنشيله من القائمة مؤقتاً
    });
  }

  /// بتشيل طالب من قائمة الطلاب
  void _deleteStudent(int index) {
    setState(() {
      currentStudents.removeAt(index);
    });
  }

  /// بتضيف محاضرة جديدة للـ List بعد ما يعبّي المستخدم النموذج
  void _addLecture() {
    if (selectedLectureName != null && selectedTeacher != null) {
      setState(() {
        lectures.add(
          Lecture(
            name: selectedLectureName!,
            teacher: selectedTeacher!,
            students: List.from(currentStudents),
            schedule: selectedSchedule,
          ),
        );
        _resetForm(); // منفرغ النموذج بعد الإضافة
      });
    }
  }

  /// بتحدث محاضرة موجودة باستخدام نفس النموذج بعد التعديل
  void _updateLecture() {
    if (editingIndex != null &&
        selectedLectureName != null &&
        selectedTeacher != null) {
      setState(() {
        lectures[editingIndex!] = Lecture(
          name: selectedLectureName!,
          teacher: selectedTeacher!,
          students: List.from(currentStudents),
          schedule: selectedSchedule,
        );
        _resetForm(); // منرجّع النموذج لوضعه الطبيعي
      });
    }
  }

  /// لما نضغط "تعديل" على محاضرة، بنحمّل معلوماتها بالنموذج
  void _editLecture(int index) {
    final lecture = lectures[index];
    setState(() {
      editingIndex = index;
      selectedLectureName = lecture.name;
      selectedTeacher = lecture.teacher;
      currentStudents = List.from(lecture.students);
      selectedSchedule = lecture.schedule;
    });
  }

  /// بتحذف محاضرة من القائمة
  void _deleteLecture(int index) {
    setState(() {
      lectures.removeAt(index);
    });
  }

  /// هاي الدالة بتعرض للمستخدم واجهة اختيار التاريخ والوقت
  Future<void> _pickSchedule() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedSchedule ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedSchedule ?? DateTime.now()),
      );
      if (time != null) {
        setState(() {
          selectedSchedule = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  /// بناء واجهة المستخدم
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lecture Manager"), // عنوان الصفحة
        backgroundColor: Colors.deepPurple, // لون الـ AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16), // حشوة داخلية للمحتوى
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // قائمة اختيار اسم المحاضرة
            DropdownButtonFormField<String>(
              value: selectedLectureName,
              items: lectureNames.map((name) {
                return DropdownMenuItem(value: name, child: Text(name));
              }).toList(),
              onChanged: (value) => setState(() => selectedLectureName = value),
              decoration: InputDecoration(
                labelText: 'Select Lecture',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // اختيار اسم المدرّس
            DropdownButtonFormField<String>(
              value: selectedTeacher,
              items: teachers.map((t) {
                return DropdownMenuItem(value: t, child: Text(t));
              }).toList(),
              onChanged: (value) => setState(() => selectedTeacher = value),
              decoration: InputDecoration(
                labelText: 'Assign Teacher',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // اختيار الجدول (التاريخ والوقت)
            Row(
              children: [
                ElevatedButton(
                  onPressed: _pickSchedule,
                  child: Text("Pick Schedule"),
                ),
                SizedBox(width: 10),
                if (selectedSchedule != null)
                  Text(
                    "${selectedSchedule!.toLocal()}".split('.')[0],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
              ],
            ),
            SizedBox(height: 10),

            // اختيار طالب من القائمة الجاهزة
            DropdownButtonFormField<String>(
              value: selectedStudent,
              items: widget.globalStudents.map((s) {
                return DropdownMenuItem(value: s, child: Text(s));
              }).toList(),
              onChanged: (value) => setState(() => selectedStudent = value),
              decoration: InputDecoration(
                labelText: 'Select Student',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),

            // زر لإضافة الطالب الحالي للمحاضرة
            ElevatedButton(
              onPressed: _addStudent,
              child: Text("Add Student to Lecture"),
            ),
            SizedBox(height: 10),

            // عرض الطلاب المضافين باستخدام Chip (زي تاج صغير)
            Wrap(
              spacing: 6,
              children: currentStudents.map((student) {
                return Chip(
                  label: Text(student),
                  onDeleted: () =>
                      _deleteStudent(currentStudents.indexOf(student)),
                  deleteIcon: Icon(Icons.close),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // زر الإضافة أو التحديث حسب إذا كنا بنضيف أو نعدّل
            Row(
              children: [
                ElevatedButton(
                  onPressed: editingIndex == null
                      ? _addLecture
                      : _updateLecture,
                  child: Text(
                    editingIndex == null ? 'Add Lecture' : 'Update Lecture',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                SizedBox(width: 10),
                if (editingIndex != null)
                  TextButton(onPressed: _resetForm, child: Text("Cancel")),
              ],
            ),
            Divider(height: 40),

            // عرض المحاضرات كلها
            Text(
              "Lectures",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true, // عشان ما يصير تعارض مع ScrollView الخارجي
              itemCount: lectures.length,
              itemBuilder: (context, index) {
                final l = lectures[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      "${l.name} - ${l.teacher}",
                    ), // اسم المحاضرة والمدرّس
                    subtitle: Text(
                      "Students: ${l.students.length} • Schedule: ${l.schedule != null ? l.schedule!.toLocal().toString().split('.')[0] : 'N/A'}",
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.orange),
                          onPressed: () => _editLecture(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteLecture(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
