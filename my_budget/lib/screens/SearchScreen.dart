// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ميزانيتي"),
        leading:  CircleAvatar(
            backgroundImage: AssetImage("assets/profile.jpg"), // صورة شخصية
          ),
        actions: [
         IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.blue,)),
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          // 🔍 مربع البحث
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(

              decoration: InputDecoration(
                hintText: "ابحث عن معاملة، فئة، أو مبلغ...",
                suffix: const Icon(Icons.search),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                
                ),
                
              ),
              textAlign: TextAlign.right,
            ),
          ),

          // 🟦 أزرار الفلترة
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _filterButton("الكل"),
                _filterButton("مصاريف"),
                _filterButton("دخل"),
                _filterButton("هذا الشهر"),
                
              ],
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("نتائج البحث",
                style: TextStyle(fontSize: 20),),
                Text("3 نتائج موجودة", style: TextStyle(color: Colors.grey[400]),)
              ],
            ),
          ),

          // 📊 نتائج البحث
          Expanded(
            child: ListView(
              children: [
                _transactionItem(
                  title: "كارفور هايبر ماركت",
                  amount: "- 450.00 رس",
                  date: "24 أكتوبر 2023",
                  category: "بقالة",
                  icon: Icons.shopping_cart,
                  color: Colors.red,
                ),
                _transactionItem(
                  title: "تحويل راتب",
                  amount: "+ 12,500.00 رس",
                  date: "25 أكتوبر 2023",
                  category: "دخل",
                  icon: Icons.attach_money,
                  color: Colors.green,
                ),
                _transactionItem(
                  title: "مطعم البيك",
                  amount: "- 85.50 رس",
                  date: "22 أكتوبر 2023",
                  category: "مطاعم",
                  icon: Icons.restaurant,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),

          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(360),
              color: Colors.grey[200]
            ),
            child: Icon(Icons.restore_rounded, size: 50,),
          ),

          SizedBox(height: 15,),

          // 🕘 عمليات بحث سابقة
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text("عمليات بحث سابقة",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text("اشتراك نتفليكس"),
                Text("فواتير الكهرباء"),
              ],
            ),
          ),
        ],
      ),

      // 🔽 شريط التنقل السفلي
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "الإحصائيات"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "البحث"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "الفئات"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "الإعدادات"),
        ],

      ),
    );
  }

  // 🔘 زر فلترة
  Widget _filterButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text),
      ),
    );
  }

  // 🧾 عنصر معاملة
  Widget _transactionItem({
    required String title,
    required String amount,
    required String date,
    required String category,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title, textAlign: TextAlign.right),
        subtitle: Text("$category • $date", textAlign: TextAlign.right),
        trailing: Text(amount,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
