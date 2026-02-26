import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  static const String supabaseUrl = 'https://vdypvemaijpfzfkppgbu.supabase.co';
  static const String apiKey = 'sb_publishable_CvnQR3yswpqlY0d_gk5cjg_mVehEV3s';

  static Future<void> init() async {
    await Supabase.initialize(url: supabaseUrl, anonKey: apiKey);
  }
}
