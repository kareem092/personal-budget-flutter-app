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



//class SearchScreen extends StatelessWidget {
//   final TextEditingController _controller =TextEditingController();
//   SearchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Icon(Icons.account_circle,
//       size: 30,), 
//       leading:  Center(
//         child: Text("ميزانيتي",
//         style: TextStyle(fontSize: 15, 
//         color: Colors.blueAccent, fontWeight: FontWeight.bold),
//         ),
//       ),
//       actions: [
//         Icon(Icons.search, color: Colors.blue,)
//       ],
//       backgroundColor: Colors.white,),
     
//       body: Column(
//         spacing: 10,
//         children: [
//         Container(padding: EdgeInsets.all(10),
        
//           child: Card(
//            elevation: 0,

//             child: TextField(
              
//               controller: _controller,
//               decoration: InputDecoration(
//                 border: UnderlineInputBorder(borderSide: BorderSide.none),
//                 hint: const Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text('..ابحث عن معاملة، فئة، مبلغ', 
//                     textAlign: TextAlign.end,
//                     style: TextStyle(fontWeight: FontWeight.bold),),
//                     Padding(padding: EdgeInsetsGeometry.all(5)),
//                     Icon(Icons.search),  
//                   ],
//                 ),
//                   ),  
//             ),
//           ),
//         ),
//         Row(
//           spacing: 10,
//           textDirection: TextDirection.rtl,
//           children: [
//              Container(
//               height: 35,
//               decoration: BoxDecoration(
//                 color: Colors.white60,
//                 borderRadius: BorderRadius.all(Radius.circular(1000),
//               ),
//               border: Border.all(width: 0.5, strokeAlign: BorderSide.strokeAlignCenter)
//               ),
//               alignment: AlignmentGeometry.center,
//                child: TextButton(onPressed: (){},
               
//                 child: Text('الكل', style: TextStyle(color: Colors.black,),
//                  ),  
//                            ),
//              ),
//             Container(
//                alignment: AlignmentGeometry.center,
//               height: 35,
//               decoration: BoxDecoration(
//                 color: Colors.white60,
//                 borderRadius: BorderRadius.all(Radius.circular(1000),
//               ),
//               border: Border.all(width: 0.5, strokeAlign: BorderSide.strokeAlignCenter)
//               ),
//               child: TextButton(onPressed: (){},
//                child: Text('مصاريف', style: TextStyle(color: Colors.black,), )
//               ),
//             ),
//             Container(
//                alignment: AlignmentGeometry.center,
//               height: 35,
//               decoration: BoxDecoration(
//                 color: Colors.white60,
//                 borderRadius: BorderRadius.all(Radius.circular(1000),
//               ),
//               border: Border.all(width: 0.5, strokeAlign: BorderSide.strokeAlignCenter)
//               ),
//               child: TextButton(onPressed: (){}, 
//               style: ButtonStyle(),
//               child: Text('دخل', style: TextStyle(color: Colors.black),)
//               ),
//             ),
//             Container(
//                alignment: AlignmentGeometry.center,
//               height: 35,
//               decoration: BoxDecoration(
//                 color: Colors.white60,
//                 borderRadius: BorderRadius.all(Radius.circular(1000),
//               ),
//               border: Border.all(width: 0.5, strokeAlign: BorderSide.strokeAlignCenter)
//               ),
//               child: TextButton(onPressed: (){}, 
//               child: Text('هذا الشهر', style: TextStyle(color: Colors.black),)
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 10,),
//         Row(
//           textDirection: TextDirection.rtl,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
//           children: [
//             Container(
//               padding: EdgeInsets.only(right: 10),
//               child: Text('نتائج البحث', style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 17
//               ),),
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 10),
//               child: Text('3 نتائج موجودة',
//               style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w100),),
//             )
//           ],
//         ),
//       ],
//       )
//     );
//   }
// }
