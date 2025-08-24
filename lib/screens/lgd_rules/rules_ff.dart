// rules_ff.dart
import 'package:flutter/material.dart';

class RulesFF extends StatelessWidget {
  const RulesFF({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LGD Custom Room & Tournament Rules"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "🔹 LGD কাস্টম রুমের নিয়ম:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "১. ৪ জনের স্কোয়াড নিয়ে কাস্টম রুমে ঢুকবেন এবং ঢোকার পরপরই স্ক্রিনশট নিয়ে টিমের নামসহ Screenshot Submit Group-এ পাঠাবেন। না হলে কিক করা হবে।",
            ),
            SizedBox(height: 5),
            Text(
              "২. ম্যাপ ডাউনলোড না থাকলে কিক।",
            ),
            SizedBox(height: 5),
            Text(
              "৩. Solo বা Duo প্লেয়ার ঢুকলে কিক করা হবে।",
            ),
            SizedBox(height: 5),
            Text(
              "৪. Custom Room-এর SMS-এ স্কোয়াডের নাম বলবেন।",
            ),
            SizedBox(height: 5),
            Text(
              "৫. ম্যাচ শেষে 10 মিনিটের মধ্যে স্ক্রিনশট না দিলে পয়েন্ট গণনা করা হবে না।",
            ),
            SizedBox(height: 15),
            Text(
              "LGD টুর্নামেন্ট রুল বুক",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "📝 রেজিস্ট্রেশন নিয়ম:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "• ৩ PM টুর্নামেন্ট: রাত ৯টা থেকে রেজিস্ট্রেশন খুলবে --> 3PM Registration Group",
            ),
            SizedBox(height: 5),
            Text(
              "• ১০ PM টুর্নামেন্ট: সকাল ৯টা থেকে রেজিস্ট্রেশন খুলবে --> 10 PM Registration Group",
            ),
            SizedBox(height: 5),
            Text(
              "• প্রথম 15 টি স্কোয়াড নাম দিলে রেজিস্ট্রেশন ক্লোজ হবে।",
            ),
            SizedBox(height: 5),
            Text(
              "• ১টি আইডি থেকে শুধু ১টি টিম রেজিস্ট্রেশন করা যাবে।",
            ),
            SizedBox(height: 5),
            Text(
              "• রেজিস্ট্রেশন ছাড়া কোনো স্কোয়াড টুর্নামেন্ট রুমে জয়েন করলে সেই স্কোয়াডকে স্থায়ীভাবে ব্যান করা হবে + আমাদের সকল FREE টুর্নামেন্ট থেকে বাদ দেওয়া হবে!",
            ),
            SizedBox(height: 15),
            Text(
              "🎯 আমাদের:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("✅ প্রতিদিন টুর্নামেন্ট (3+10 PM)"),
            Text("✅ প্রফেশনাল ব্যানার ও লাইভ স্ট্রিম (Facebook: facebook.com/LGDTAJ and YouTube: youtube.com/@LGDTAJ)"),
            Text("✅ ফেয়ার প্লে নিশ্চিত করুন, গালিগালাজ নিষেধ"),
            SizedBox(height: 15),
            Text(
              "📌 নিয়ম মেনে খেলুন, সবাইকে সম্মান দিন!\n________LGD ADMIN",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
