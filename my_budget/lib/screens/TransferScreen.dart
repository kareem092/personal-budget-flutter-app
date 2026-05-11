import 'package:flutter/material.dart';



class Transferscreen extends StatelessWidget {
  const Transferscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ميزانيتي',
      // إعداد اللغة العربية والاتجاه من اليمين لليسار
      locale: const Locale('ar', 'SA'),
      theme: ThemeData(
        primaryColor: const Color(0xff003fb1),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        fontFamily: 'Tajawal', // تأكد من إضافة الخط في pubspec.yaml
      ),
      home: const TransferPage(),
    );
  }
}

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPageHeader(),
              const SizedBox(height: 32),
              _buildTransferFlow(),
              const SizedBox(height: 32),
              _buildMainForm(),
              const SizedBox(height: 24),
              _buildQuickSummary(),
              const SizedBox(height: 80), // مساحة للتمرير فوق البار السفلي
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNav(),
      ),
    );
  }

  // شريط التطبيق العلوي
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAslFNTnWQMAFbezYUvfgXJbyuBp2yzuWkL8gqAV2LvLk46cWlP8lH1TPdSKbMn3GaRrLK-insS_TEOSNmIBetAafk-Q9POfFhdbyqiXpKUxaardMfLnAJ-b6zuueY1jkMpY9053KzhAUtG7hBWe7Bk_Ph-obMbb05ewZRI5gUndKtIhHMTEYqrEuzmFsKP4n5N3egYQ2i5XAEar3L8E-AJ8rOG8AdZ0FTvStghcao4HIRVCTpCm8CiXczHQc2VXH8mOgaTBM2zDZDB'),
          ),
          const SizedBox(width: 12),
          Text(
            'ميزانيتي',
            style: TextStyle(
              color: Color(0xFF003FB1),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Color(0xFF003FB1)),
          onPressed: () {},
        ),
      ],
    );
  }

  // عنوان الصفحة
  Widget _buildPageHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'تحويل مالي',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF191C1D)),
        ),
        SizedBox(height: 4),
        Text(
          'قم بنقل الأموال بين حساباتك الشخصية بسهولة',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  // مرئيات تدفق التحويل (من -> إلى)
  Widget _buildTransferFlow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildFlowCard('من', Icons.account_balance_wallet, const Color(0xFFDBE1FF), const Color(0xFF003FB1)),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Divider(color: Colors.grey.shade300, thickness: 2, indent: 10, endIndent: 10),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Icon(Icons.arrow_forward, size: 16, color: Color(0xFF003FB1)),
              ),
            ],
          ),
        ),
        _buildFlowCard('إلى', Icons.savings, const Color(0xFF85F8C4).withOpacity(0.3), const Color(0xFF006C4A)),
      ],
    );
  }

  Widget _buildFlowCard(String label, IconData icon, Color bgColor, Color iconColor) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // النموذج الرئيسي
  Widget _buildMainForm() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 12)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDropdownField('الحساب المصدر', 'الحساب الجاري (.... 4829)', Icons.account_balance),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('الرصيد المتاح: 12,450.00 ر.س', style: TextStyle(color: Color(0xFF006C4A), fontSize: 12)),
          ),
          const SizedBox(height: 20),
          _buildDropdownField('الحساب الهدف', 'اختر حساب التوفير أو الاستثمار', Icons.flag),
          const SizedBox(height: 24),
          const Text('المبلغ المراد تحويله', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF003FB1)),
            decoration: InputDecoration(
              hintText: '0.00',
              prefixText: 'ر.س',
              filled: true,
              fillColor: const Color(0xFFF3F4F5),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ['100', '500', '1000', 'الكل'].map((val) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
                child: Text(val, style: const TextStyle(fontSize: 12)),
              ),
            )).toList(),
          ),
          const SizedBox(height: 20),
          const Text('ملاحظات (اختياري)', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'أضف وصفاً للعملية...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.sync_alt),
              label: const Text('تأكيد عملية التحويل', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF003FB1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(icon, color: Colors.grey),
            title: Text(value, style: const TextStyle(fontSize: 14)),
            trailing: const Icon(Icons.expand_more),
          ),
        ),
      ],
    );
  }

  // ملخص إحصائي سريع
  Widget _buildQuickSummary() {
    return Row(
      children: [
        _buildStatCard('آخر تحويل', 'منذ يومين', Icons.history, Colors.blue.shade50, const Color(0xFF003FB1)),
        const SizedBox(width: 16),
        _buildStatCard('معدل التحويل', '2,500 ر.س / شهر', Icons.insights, Colors.green.shade50, const Color(0xFF006C4A)),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color bgColor, Color textColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Icon(icon, color: textColor),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            Text(value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: textColor)),
          ],
        ),
      ),
    );
  }

  // شريط التنقل السفلي
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF003FB1),
      unselectedItemColor: Colors.grey,
      currentIndex: 2, // "الفئات" مفعلة بناءً على التصميم
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'الإعدادات'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'الفئات'),
        BottomNavigationBarItem(icon: Icon(Icons.equalizer), label: 'الإحصائيات'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
      ],
    );
  }
}
