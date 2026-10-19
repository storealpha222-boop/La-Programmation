import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStore.init();
  runApp(const ManhajApp());
}

class Lesson {
  const Lesson({
    required this.title,
    required this.duration,
    required this.content,
  });

  final String title;
  final int duration;
  final String content;

  Map<String, dynamic> toJson() => {
        'title': title,
        'duration': duration,
        'content': content,
      };

  factory Lesson.fromJson(Map<String, dynamic> j) => Lesson(
        title: j['title'] as String,
        duration: j['duration'] as int,
        content: j['content'] as String,
      );
}

class Course {
  const Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.category,
    required this.level,
    required this.hours,
    required this.rating,
    required this.students,
    required this.description,
    required this.color,
    required this.lessons,
  });

  final int id;
  final String title;
  final String instructor;
  final String category;
  final String level;
  final int hours;
  final double rating;
  final int students;
  final String description;
  final Color color;
  final List<Lesson> lessons;
}

const courses = <Course>[
  Course(
    id: 1,
    title: 'La Programmation',
    instructor: 'م. أحمد',
    category: 'برمجة',
    level: 'مبتدئ',
    hours: 12,
    rating: 4.9,
    students: 3420,
    description:
        'تعلم أساسيات لغة Dart من الصفر حتى بناء تطبيقات حقيقية. تغطي الدورة المتغيرات، الدوال، الكائنات، والتعامل مع القوائم.',
    color: Color(0xFF5B6BF5),
    lessons: [
      Lesson(
        title: 'La Programmation',
        duration: 15,
        content:
            'تعرف على لغة Dart ولماذا تعد الخيار الأول لتطوير تطبيقات Flutter. سنتعرف على تاريخ اللغة، مميزاتها، وأدوات التطوير الأساسية.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 22,
        content:
            'شرح مفصل للمتغيرات في Dart: int, double, String, bool. الفرق بين var و final و const، وكيفية استخدام كل منها بشكل صحيح.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 25,
        content:
            'استخدام if-else و switch للتحكم في تدفق البرنامج. حلقات for و while و do-while مع أمثلة عملية.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 20,
        content:
            'تعريف الدوال، المعاملات الإلزامية والاختيارية، القيم المرجعة، الدوال السهمية، والدوال المجهولة.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 28,
        content:
            'التعامل مع List و Map و Set. إضافة العناصر، حذفها، والمرور عليها باستخدام أساليب حديثة مثل map و where و fold.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 30,
        content:
            'أساسيات OOP في Dart: الكلاسات، الكائنات، الوراثة، الواجهات، والكلاسات المجردة.',
      ),
    ],
  ),
  Course(
    id: 2,
    title: 'La Programmation',
    instructor: 'أ. سارة',
    category: 'تصميم',
    level: 'متوسط',
    hours: 15,
    rating: 4.8,
    students: 2180,
    description:
        'اكتشف مبادئ تصميم واجهات المستخدم UI/UX الحديثة وكيفية تطبيقها بأدوات عملية لإنشاء تجارب استخدام مميزة.',
    color: Color(0xFFFF8A65),
    lessons: [
      Lesson(
        title: 'La Programmation',
        duration: 18,
        content:
            'المحاذاة، التقارب، التسلسل الهرمي، والتباين. كيف تجعل التصميم متنفساً وسهل القراءة.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 22,
        content:
            'اختيار الألوان المتناسقة، عجلة الألوان، والنفسيولوجية اللونية في تطبيقات الجوال.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 20,
        content:
            'اختيار الخطوط العربية والإنجليزية، أحجام الخطوط، والمسافات بين الأسطر.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 25,
        content:
            'تصميم واجهات تعمل على أحجام شاشات مختلفة من الجوال إلى التابلت.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 24,
        content:
            'كيفية إضافة أنيميشن سلس يعزز تجربة المستخدم دون إثقال الأداء.',
      ),
    ],
  ),
  Course(
    id: 3,
    title: 'La Programmation',
    instructor: 'د. خالد',
    category: 'أعمال',
    level: 'مبتدئ',
    hours: 10,
    rating: 4.7,
    students: 1850,
    description:
        'استراتيجيات التسويق الرقمي الحديثة: السوشيال ميديا، الإعلانات المدفوعة، SEO، والمحتوى.',
    color: Color(0xFF3EB489),
    lessons: [
      Lesson(
        title: 'La Programmation',
        duration: 15,
        content:
            'تعريف التسويق الرقمي، الفرق بينه وبين التسويق التقليدي، وقنوات التسويق الرئيسية.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 22,
        content:
            'بناء حضور فعّال على Instagram و TikTok و Twitter. أنواع المحتوى وتوقيت النشر.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 26,
        content:
            'إطلاق حملات على Google Ads و Meta Ads. تحديد الميزانية، الاستهداف، وقياس النتائج.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 24,
        content:
            'كيف تتصدر نتائج البحث، الكلمات المفتاحية، والمحتوى الذي يحبه Google.',
      ),
    ],
  ),
  Course(
    id: 4,
    title: 'La Programmation',
    instructor: 'أ. نورة',
    category: 'لغات',
    level: 'مبتدئ',
    hours: 18,
    rating: 4.9,
    students: 5230,
    description:
        'بناء مهارات التحدث بالإنجليزية من الصفر بأنماط تفاعلية ومفردات الحياة اليومية.',
    color: Color(0xFF9C6BFF),
    lessons: [
      Lesson(
        title: 'La Programmation',
        duration: 14,
        content:
            'كيف تعرف بنفسك بالإنجليزية: الاسم، العمل، الهوايات، والأهداف.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 18,
        content:
            'عبارات أساسية تستخدمها في المطعم، المطار، الفندق، والتسوق.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 25,
        content:
            'Present Simple، Past Simple، Future. متى تستخدم كل زمن مع أمثلة.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 20,
        content:
            'أهم 500 كلمة إنجليزية تستخدم في المحادثات اليومية.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 22,
        content:
            'مخارج الحروف الإنجليزية، الأصوات الصامتة، والنغمة الصحيحة.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 28,
        content:
            'محادثة كاملة مع ناطق أصلي، تحليل العبارات، وتدريب عملي.',
      ),
    ],
  ),
  Course(
    id: 5,
    title: 'La Programmation',
    instructor: 'م. عبدالله',
    category: 'أعمال',
    level: 'متقدم',
    hours: 14,
    rating: 4.8,
    students: 1240,
    description:
        'منهجيات إدارة المشاريع الحديثة Agile و Scrum مع تطبيقات عملية وأدوات احترافية.',
    color: Color(0xFFFFB300),
    lessons: [
      Lesson(
        title: 'La Programmation',
        duration: 16,
        content:
            'تعريف المشروع، دورة الحياة، وأدوار فريق العمل.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 24,
        content:
            'مبادئ Agile الأربعة، الفرق بينها وبين الإدارة التقليدية.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 28,
        content:
            'Sprint، Daily Standup، Retrospective. كيف تطبق Scrum بشكل صحيح.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 20,
        content:
            'Jira، Trello، Asana. كيفية اختيار الأداة المناسبة.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 22,
        content:
            'تحديد المخاطر، تقييمها، ووضع خطط للتعامل معها.',
      ),
    ],
  ),
  Course(
    id: 6,
    title: 'La Programmation',
    instructor: 'أ. محمد',
    category: 'علوم',
    level: 'متوسط',
    hours: 20,
    rating: 4.6,
    students: 2960,
    description:
        'شرح مبسط لمنهج الرياضيات للثانوية: التفاضل، التكامل، والمتتابعات.',
    color: Color(0xFF00ACC1),
    lessons: [
      Lesson(
        title: 'La Programmation',
        duration: 22,
        content:
            'المتتابعات الحسابية والهندسية، الحد العام، والمجموع.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 25,
        content:
            'مفهوم النهاية، النهايات عند اللانهاية، وحالات عدم التعيين.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 28,
        content:
            'قواعد الاشتقاق، مشتقة الدوال المركبة، وتطبيقات هندسية.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 30,
        content:
            'التكامل غير المحدد والمحدد، تطبيقات المساحات والحجوم.',
      ),
    ],
  ),
  Course(
    id: 7,
    title: 'La Programmation',
    instructor: 'أ. ريم',
    category: 'تصميم',
    level: 'مبتدئ',
    hours: 8,
    rating: 4.7,
    students: 1420,
    description:
        'أساسيات التصوير الاحترافي: الإضاءة، التكوين، والمعالجة بأدوات حديثة.',
    color: Color(0xFFE91E63),
    lessons: [
      Lesson(
        title: 'La Programmation',
        duration: 18,
        content:
            'ISO، Shutter Speed، Aperture. كيف تتحكم بالكاميرا يدوياً.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 20,
        content:
            'قاعدة الثلث، الخطوط الموجهة، التوازن البصري.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 22,
        content:
            'استغلال ضوء الشمس، الساعة الذهبية، والظلال.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 25,
        content:
            'تحرير الصور باستخدام Lightroom و Snapseed.',
      ),
    ],
  ),
  Course(
    id: 8,
    title: 'La Programmation',
    instructor: 'م. فيصل',
    category: 'برمجة',
    level: 'متوسط',
    hours: 16,
    rating: 4.8,
    students: 1980,
    description:
        'تعرف على أساسيات الأمن السيبراني وكيفية حماية الأنظمة والبيانات من الهجمات.',
    color: Color(0xFF37474F),
    lessons: [
      Lesson(
        title: 'La Programmation',
        duration: 18,
        content:
            'مفاهيم أساسية، أنواع المهاجمين، والتهديدات الشائعة.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 25,
        content:
            'التشفير المتماثل وغير المتماثل، HTTPS، والشهادات الرقمية.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 24,
        content:
            'الجدر النارية، VPN، وكشف التسلل.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 28,
        content:
            'منهجية اختبار الاختراق الأخلاقي وأدوات Kali Linux.',
      ),
      Lesson(
        title: 'La Programmation',
        duration: 22,
        content:
            'خطة الاستجابة، التحليل الجنائي، والتعافي.',
      ),
    ],
  ),
];

class AppStore {
  static late SharedPreferences prefs;

  static const _kName = 'manhaj_username';
  static const _kDark = 'manhaj_dark';
  static const _kEnrolled = 'manhaj_enrolled';
  static const _kCompleted = 'manhaj_completed';

  static String username = '';
  static bool isDark = false;
  static Set<int> enrolled = {};
  static Map<int, Set<int>> completed = {};

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    username = prefs.getString(_kName) ?? '';
    isDark = prefs.getBool(_kDark) ?? false;

    final enrolledRaw = prefs.getString(_kEnrolled);
    if (enrolledRaw != null) {
      enrolled = (jsonDecode(enrolledRaw) as List).cast<int>().toSet();
    }

    final completedRaw = prefs.getString(_kCompleted);
    if (completedRaw != null) {
      final map = jsonDecode(completedRaw) as Map<String, dynamic>;
      completed = map.map(
        (k, v) => MapEntry(
          int.parse(k),
          (v as List).cast<int>().toSet(),
        ),
      );
    }
  }

  static Future<void> saveUsername(String name) async {
    username = name;
    await prefs.setString(_kName, name);
  }

  static Future<void> saveDark(bool value) async {
    isDark = value;
    await prefs.setBool(_kDark, value);
  }

  static Future<void> saveEnrolled() async {
    await prefs.setString(_kEnrolled, jsonEncode(enrolled.toList()));
  }

  static Future<void> saveCompleted() async {
    final encoded = completed.map(
      (k, v) => MapEntry(k.toString(), v.toList()),
    );
    await prefs.setString(_kCompleted, jsonEncode(encoded));
  }

  static void toggleEnroll(int courseId) {
    if (enrolled.contains(courseId)) {
      enrolled.remove(courseId);
      completed.remove(courseId);
    } else {
      enrolled.add(courseId);
    }
    saveEnrolled();
    saveCompleted();
  }

  static bool isLessonCompleted(int courseId, int lessonIndex) {
    return completed[courseId]?.contains(lessonIndex) ?? false;
  }

  static void toggleLesson(int courseId, int lessonIndex) {
    completed.putIfAbsent(courseId, () => {});
    if (completed[courseId]!.contains(lessonIndex)) {
      completed[courseId]!.remove(lessonIndex);
    } else {
      completed[courseId]!.add(lessonIndex);
    }
    saveCompleted();
  }

  static double progress(int courseId) {
    final course = courses.firstWhere((c) => c.id == courseId);
    final done = completed[courseId]?.length ?? 0;
    return done / course.lessons.length;
  }

  static int completedLessonsCount(int courseId) {
    return completed[courseId]?.length ?? 0;
  }

  static int totalPoints() {
    int total = 0;
    for (final entry in completed.entries) {
      total += entry.value.length * 10;
    }
    return total;
  }

  static int completedCoursesCount() {
    int count = 0;
    for (final courseId in enrolled) {
      if (progress(courseId) >= 1.0) count++;
    }
    return count;
  }
}

class ManhajApp extends StatefulWidget {
  const ManhajApp({super.key});

  @override
  State<ManhajApp> createState() => _ManhajAppState();
}

class _ManhajAppState extends State<ManhajApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'La Programmation',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: AppStore.isDark ? ThemeMode.dark : ThemeMode.light,
      home: AppStore.username.isEmpty
          ? WelcomeScreen(
              onDone: (name) {
                AppStore.saveUsername(name);
                setState(() {});
              },
            )
          : ManhajHome(
              onThemeChanged: () => setState(() {}),
              onReset: () => setState(() {}),
            ),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.onDone});

  final ValueChanged<String> onDone;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  final _controller = TextEditingController();
  late final AnimationController _anim;

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
  }

  @override
  void dispose() {
    _anim.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: FadeTransition(
            opacity: _anim,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.15),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: _anim, curve: Curves.easeOutCubic),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      gradient: AppTheme.primaryGradient,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Icon(
                      Icons.school_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'أهلاً بك في منهاج',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'رحلة تعليمية مصممة لتنمية مهاراتك خطوة بخطوة',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      height: 1.6,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: _controller,
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _submit(),
                    decoration: const InputDecoration(
                      hintText: 'اكتب اسمك للبدء',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _submit,
                      child: const Text('ابدأ الآن'),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final name = _controller.text.trim();
    if (name.isEmpty) return;
    widget.onDone(name);
  }
}

class ManhajHome extends StatefulWidget {
  const ManhajHome({
    super.key,
    required this.onThemeChanged,
    required this.onReset,
  });

  final VoidCallback onThemeChanged;
  final VoidCallback onReset;

  @override
  State<ManhajHome> createState() => _ManhajHomeState();
}

class _ManhajHomeState extends State<ManhajHome> {
  int _tab = 0;
  String _query = '';
  String _category = 'الكل';

  final _categories = const [
    'الكل',
    'برمجة',
    'تصميم',
    'أعمال',
    'لغات',
    'علوم',
  ];

  List<Course> get _filtered => courses.where((c) {
        final matchCat = _category == 'الكل' || c.category == _category;
        final matchQuery = _query.isEmpty ||
            c.title.contains(_query) ||
            c.instructor.contains(_query) ||
            c.category.contains(_query);
        return matchCat && matchQuery;
      }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('منهاج'),
        actions: [
          IconButton(
            tooltip: 'الوضع الليلي',
            onPressed: () {
              AppStore.saveDark(!AppStore.isDark);
              widget.onThemeChanged();
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, anim) =>
                  RotationTransition(turns: anim, child: child),
              child: Icon(
                AppStore.isDark
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
                key: ValueKey(AppStore.isDark),
              ),
            ),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: IndexedStack(
        index: _tab,
        children: [
          _homeTab(),
          _exploreTab(),
          _myCoursesTab(),
          _profileTab(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (v) => setState(() => _tab = v),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'استكشاف',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'دوراتي',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'حسابي',
          ),
        ],
      ),
    );
  }

  Widget _homeTab() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
      children: [
        _heroBanner(),
        const SizedBox(height: 24),
        _sectionTitle('التصنيفات', null),
        const SizedBox(height: 12),
        _categoryStrip(),
        const SizedBox(height: 24),
        _sectionTitle(
          'دورات مميزة',
          '${_filtered.length} دورة',
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _filtered.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (_, i) => _CourseCard(
            course: _filtered[i],
            index: i,
            onTap: () => _openCourse(_filtered[i]),
          ),
        ),
      ],
    );
  }

  Widget _heroBanner() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withValues(alpha: 0.25),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStore.username.isEmpty
                      ? 'ابدأ رحلتك'
                      : 'مرحباً ${AppStore.username}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'طوّر مهاراتك اليوم',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton.tonal(
                  onPressed: () => setState(() => _tab = 1),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppTheme.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('تصفح الدورات'),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Icon(
              Icons.auto_stories_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, String? trailing) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        if (trailing != null)
          Text(
            trailing,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }

  Widget _categoryStrip() {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final cat = _categories[i];
          final selected = _category == cat;
          return ChoiceChip(
            label: Text(cat),
            selected: selected,
            onSelected: (_) => setState(() => _category = cat),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          );
        },
      ),
    );
  }

  Widget _exploreTab() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
      children: [
        TextField(
          onChanged: (v) => setState(() => _query = v),
          decoration: const InputDecoration(
            hintText: 'ابحث عن دورة أو مدرب',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        const SizedBox(height: 16),
        _categoryStrip(),
        const SizedBox(height: 24),
        _sectionTitle('النتائج', '${_filtered.length} دورة'),
        const SizedBox(height: 12),
        if (_filtered.isEmpty)
          _emptyState('لا توجد نتائج مطابقة')
        else
          ..._filtered.asMap().entries.map(
                (entry) => _CourseListTile(
                  course: entry.value,
                  index: entry.key,
                  onTap: () => _openCourse(entry.value),
                ),
              ),
      ],
    );
  }

  Widget _myCoursesTab() {
    final myCourses =
        courses.where((c) => AppStore.enrolled.contains(c.id)).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
      children: [
        _statsRow(),
        const SizedBox(height: 24),
        _sectionTitle('دوراتي', '${myCourses.length} دورة'),
        const SizedBox(height: 12),
        if (myCourses.isEmpty)
          _emptyState('لم تسجل في أي دورة بعد')
        else
          ...myCourses.asMap().entries.map(
                (entry) => _MyCourseTile(
                  course: entry.value,
                  index: entry.key,
                  onTap: () => _openCourse(entry.value),
                ),
              ),
      ],
    );
  }

  Widget _statsRow() {
    return Row(
      children: [
        Expanded(
          child: _statCard(
            icon: Icons.menu_book_outlined,
            value: '${AppStore.enrolled.length}',
            label: 'دورة مسجلة',
            color: AppTheme.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _statCard(
            icon: Icons.check_circle_outline,
            value: '${AppStore.completedCoursesCount()}',
            label: 'دورة مكتملة',
            color: AppTheme.secondary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _statCard(
            icon: Icons.star_outline,
            value: '${AppStore.totalPoints()}',
            label: 'نقطة',
            color: const Color(0xFF3EB489),
          ),
        ),
      ],
    );
  }

  Widget _statCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileTab() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    AppStore.username.isNotEmpty
                        ? AppStore.username.characters.first
                        : '؟',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStore.username.isEmpty
                          ? 'طالب'
                          : AppStore.username,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'متعلم في منهاج',
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              _settingsTile(
                icon: Icons.dark_mode_outlined,
                title: 'La Programmation',
                trailing: Switch.adaptive(
                  value: AppStore.isDark,
                  onChanged: (v) {
                    AppStore.saveDark(v);
                    widget.onThemeChanged();
                  },
                ),
              ),
              const Divider(height: 1),
              _settingsTile(
                icon: Icons.info_outline,
                title: 'La Programmation',
                trailing: const Icon(Icons.chevron_left),
                onTap: () => _showAbout(),
              ),
              const Divider(height: 1),
              _settingsTile(
                icon: Icons.delete_outline,
                title: 'La Programmation',
                titleColor: Colors.red,
                iconColor: Colors.red,
                trailing: const Icon(Icons.chevron_left),
                onTap: _confirmReset,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            'منهاج - الإصدار 1.0.0',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  Widget _settingsTile({
    required IconData icon,
    required String title,
    required Widget trailing,
    VoidCallback? onTap,
    Color? titleColor,
    Color? iconColor,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: titleColor,
        ),
      ),
      trailing: trailing,
    );
  }

  void _showAbout() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        icon: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.school_outlined,
            color: Colors.white,
            size: 28,
          ),
        ),
        title: const Text(
          'منهاج',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'منصة تعليمية تجريبية لعرض الدورات ومتابعة التقدم. جميع البيانات محفوظة على جهازك فقط.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'الإصدار 1.0.0',
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }

  void _confirmReset() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('حذف كل البيانات'),
        content: const Text(
          'سيتم حذف كل الدورات المسجلة والتقدم واسم المستخدم. لا يمكن التراجع عن هذا الإجراء.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () async {
              await AppStore.prefs.clear();
              AppStore.username = '';
              AppStore.enrolled = {};
              AppStore.completed = {};
              AppStore.isDark = false;
              Navigator.pop(dialogContext);
              widget.onReset();
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }

  void _openCourse(Course course) {
    Navigator.of(context)
        .push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            reverseTransitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (_, animation, __) => FadeTransition(
              opacity: animation,
              child: CourseDetailScreen(course: course),
            ),
            transitionsBuilder: (_, animation, __, child) {
              final curved = CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              );
              return FadeTransition(
                opacity: curved,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.05),
                    end: Offset.zero,
                  ).animate(curved),
                  child: child,
                ),
              );
            },
          ),
        )
        .then((_) => setState(() {}));
  }

  Widget _emptyState(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .onSurfaceVariant
                  .withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              Icons.inbox_outlined,
              size: 40,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({
    required this.course,
    required this.index,
    required this.onTap,
  });

  final Course course;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final progress = AppStore.progress(course.id);
    final enrolled = AppStore.enrolled.contains(course.id);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 350 + (index * 60)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: child,
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        course.color,
                        course.color.withValues(alpha: 0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -14,
                        right: -14,
                        child: Icon(
                          Icons.school_outlined,
                          size: 90,
                          color: Colors.white.withValues(alpha: 0.18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.25),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                course.level,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            if (enrolled)
                              TweenAnimationBuilder<double>(
                                tween: Tween(begin: 0, end: progress),
                                duration:
                                    const Duration(milliseconds: 700),
                                curve: Curves.easeOutCubic,
                                builder: (_, value, __) => Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(10),
                                      child: LinearProgressIndicator(
                                        value: value,
                                        minHeight: 5,
                                        backgroundColor: Colors.white
                                            .withValues(alpha: 0.3),
                                        valueColor:
                                            const AlwaysStoppedAnimation(
                                          Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${(value * 100).toInt()}%',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.category,
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      course.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFB300),
                          size: 16,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          course.rating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurfaceVariant,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${course.hours}س',
                          style: TextStyle(
                            fontSize: 11,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CourseListTile extends StatelessWidget {
  const _CourseListTile({
    required this.course,
    required this.index,
    required this.onTap,
  });

  final Course course;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 300 + (index * 50)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(20 * (1 - value), 0),
          child: child,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        course.color,
                        course.color.withValues(alpha: 0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.play_lesson_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        course.instructor,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFB300),
                            size: 14,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            course.rating.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.access_time,
                            size: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            '${course.hours}س',
                            style: TextStyle(
                              fontSize: 11,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.people_outline,
                            size: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            '${course.students}',
                            style: TextStyle(
                              fontSize: 11,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_left),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MyCourseTile extends StatelessWidget {
  const _MyCourseTile({
    required this.course,
    required this.index,
    required this.onTap,
  });

  final Course course;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final progress = AppStore.progress(course.id);
    final done = AppStore.completedLessonsCount(course.id);
    final total = course.lessons.length;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 350 + (index * 60)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: child,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            course.color,
                            course.color.withValues(alpha: 0.7),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.school_outlined,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$done من $total درس',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: course.color,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: progress),
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.easeOutCubic,
                    builder: (_, value, __) => LinearProgressIndicator(
                      value: value,
                      minHeight: 6,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .onSurfaceVariant
                          .withValues(alpha: 0.1),
                      valueColor: AlwaysStoppedAnimation(course.color),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key, required this.course});

  final Course course;

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _anim;

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();
  }

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final course = widget.course;
    final enrolled = AppStore.enrolled.contains(course.id);
    final progress = AppStore.progress(course.id);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: course.color,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withValues(alpha: 0.2),
                foregroundColor: Colors.white,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      course.color,
                      course.color.withValues(alpha: 0.75),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -30,
                      left: -30,
                      child: Icon(
                        Icons.school_outlined,
                        size: 220,
                        color: Colors.white.withValues(alpha: 0.12),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.25),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                course.category,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              course.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              course.instructor,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _anim,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: _anim,
                    curve: Curves.easeOutCubic,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _infoGrid(course),
                      if (enrolled) ...[
                        const SizedBox(height: 20),
                        _progressCard(progress),
                      ],
                      const SizedBox(height: 24),
                      const Text(
                        'عن الدورة',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        course.description,
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant,
                          height: 1.7,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'محتوى الدورة',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            '${course.lessons.length} درس',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...course.lessons.asMap().entries.map(
                            (e) => _lessonTile(
                              course: course,
                              lesson: e.value,
                              index: e.key,
                              enrolled: enrolled,
                            ),
                          ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: _bottomBar(course, enrolled),
    );
  }

  Widget _infoGrid(Course course) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _infoItem(
            icon: Icons.star_rounded,
            value: course.rating.toStringAsFixed(1),
            label: 'التقييم',
            color: const Color(0xFFFFB300),
          ),
          _divider(),
          _infoItem(
            icon: Icons.people_outline,
            value: '${course.students}',
            label: 'طالب',
            color: AppTheme.primary,
          ),
          _divider(),
          _infoItem(
            icon: Icons.access_time,
            value: '${course.hours}س',
            label: 'المدة',
            color: AppTheme.secondary,
          ),
          _divider(),
          _infoItem(
            icon: Icons.signal_cellular_alt,
            value: course.level,
            label: 'المستوى',
            color: const Color(0xFF3EB489),
          ),
        ],
      ),
    );
  }

  Widget _infoItem({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 1,
      height: 34,
      color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(
            alpha: 0.15,
          ),
    );
  }

  Widget _progressCard(double progress) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 54,
            height: 54,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: progress),
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeOutCubic,
              builder: (_, value, __) => Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: value,
                    strokeWidth: 5,
                    backgroundColor: Colors.white.withValues(alpha: 0.25),
                    valueColor: const AlwaysStoppedAnimation(Colors.white),
                  ),
                  Text(
                    '${(value * 100).toInt()}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'تقدمك في الدورة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  progress >= 1.0
                      ? 'أكملت الدورة بنجاح'
                      : 'واصل التعلم للوصول إلى الإنجاز',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _lessonTile({
    required Course course,
    required Lesson lesson,
    required int index,
    required bool enrolled,
  }) {
    final done = AppStore.isLessonCompleted(course.id, index);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: enrolled ? () => _openLesson(course, lesson, index) : null,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: done
                        ? course.color
                        : course.color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: done
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              key: ValueKey('done'),
                            )
                          : Text(
                              '${index + 1}',
                              key: const ValueKey('num'),
                              style: TextStyle(
                                color: course.color,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lesson.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          decoration:
                              done ? TextDecoration.lineThrough : null,
                          color: done
                              ? Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant
                              : null,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.play_circle_outline,
                            size: 14,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${lesson.duration} دقيقة',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_left,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomBar(Course course, bool enrolled) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        14,
        20,
        14 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton(
          onPressed: () {
            AppStore.toggleEnroll(course.id);
            setState(() {});
          },
          style: FilledButton.styleFrom(
            backgroundColor:
                enrolled ? Colors.red.withValues(alpha: 0.9) : course.color,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            enrolled ? 'إلغاء التسجيل' : 'التسجيل في الدورة',
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  void _openLesson(Course course, Lesson lesson, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _LessonSheet(
        course: course,
        lesson: lesson,
        index: index,
        onChanged: () => setState(() {}),
      ),
    );
  }
}

class _LessonSheet extends StatefulWidget {
  const _LessonSheet({
    required this.course,
    required this.lesson,
    required this.index,
    required this.onChanged,
  });

  final Course course;
  final Lesson lesson;
  final int index;
  final VoidCallback onChanged;

  @override
  State<_LessonSheet> createState() => _LessonSheetState();
}

class _LessonSheetState extends State<_LessonSheet> {
  @override
  Widget build(BuildContext context) {
    final done = AppStore.isLessonCompleted(widget.course.id, widget.index);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, controller) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(28),
          ),
        ),
        child: ListView(
          controller: controller,
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            Center(
              child: Container(
                width: 44,
                height: 5,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 160,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    widget.course.color,
                    widget.course.color.withValues(alpha: 0.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: -20,
                    left: -20,
                    child: Icon(
                      Icons.play_circle_outline,
                      size: 140,
                      color: Colors.white.withValues(alpha: 0.15),
                    ),
                  ),
                  const Center(
                    child: Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 64,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'الدرس ${widget.index + 1}',
              style: TextStyle(
                color: widget.course.color,
                fontWeight: FontWeight.w800,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.lesson.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Text(
                  '${widget.lesson.duration} دقيقة',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'محتوى الدرس',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.lesson.content,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                height: 1.8,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 28),
            FilledButton.icon(
              onPressed: () {
                AppStore.toggleLesson(widget.course.id, widget.index);
                widget.onChanged();
                setState(() {});
              },
              style: FilledButton.styleFrom(
                backgroundColor: done
                    ? Colors.red.withValues(alpha: 0.9)
                    : widget.course.color,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              icon: Icon(
                done ? Icons.close : Icons.check,
              ),
              label: Text(
                done ? 'إلغاء الإكمال' : 'تحديد كمكتمل',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}