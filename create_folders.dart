import 'dart:io';

void main() {
  // مسار المشروع الحالي
  final projectPath = "${Directory.current.path}/lib";

  // قائمة المجلدات التي سيتم إنشاؤها
  final directories = [
    '$projectPath/models', // Model
    '$projectPath/views', // View
    '$projectPath/controllers', // Controller
  ];

  // حلقة لإنشاء كل المجلدات
  for (var dir in directories) {
    final directory = Directory(dir);

    // التحقق من وجود المجلد، وإن لم يكن موجودًا يتم إنشاؤه
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      print('Created: $dir ✔');
    } else {
      print('Directory already exists: $dir ');
    }
  }

  print('تم إنشاء المجلدات بنجاح ✔');
}
