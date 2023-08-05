import 'package:flutter/material.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/custom_back_button_widget.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class AboutAppPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/about-app';

  AboutAppPage({Key? key}) : super(key: key);

  @override
  _AboutAppPageState createState() => _AboutAppPageState();
}

class _AboutAppPageState extends NyState<AboutAppPage> {
  @override
  init() async {
    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String text = '''
**Selamat datang di StuntShield App**

> Lindungi Pertumbuhan, Lindungi Masa Depan

StuntShield adalah aplikasi inovatif yang dirancang khusus untuk memberikan resep makanan bergizi dengan panduan nutrisi yang tepat dan alat yang dapat mengukur stunting pada balita, semuanya dalam satu genggaman.

**Fitur Unggulan:**
 - 🥗 **Resep Makanan Bergizi:** Temukan ragam resep makanan lezat dan bergizi yang dirancang khusus untuk mendukung pertumbuhan optimal balita dan mencegah stunting. Nikmati hidangan yang sehat tanpa mengorbankan cita rasa.
 - 📊 **Kalkulator Stunting:** Khawatir tentang pertumbuhan balita? Gunakan kalkulator stunting untuk memonitor perkembangan fisik mereka. Dengan data yang diambil dari sumber terpercaya, Ayo mengambil langkah tepat untuk mencegah risiko stunting.
 
**Mengapa Memilih StuntShield App?**
StuntShield bukan hanya sekadar aplikasi, melainkan gerakan untuk memastikan masa depan yang cerah bagi generasi mendatang. Kami percaya bahwa setiap balita berhak tumbuh dan berkembang dengan optimal serta berkomitmen untuk memberikan edukasi dan solusi inovatif berlandaskan teknologi dalam rangka pencegahan stunting di Indonesia.

> **Tim Pengembang:**
> Ridwan Setiawan, S.T., M.Kom.
> Asri Mulyani, S.Pd., M.Kom.
> dr. Nopitasari, C. NNLP
> Galih Muhammad Ramdan

&copy; 2023 Institut Teknologi Garut & Komunitas Ibu Cegah Stunting
''';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CustomBackButton(),
                  title: Text(
                    'Tentang Aplikasi',
                    style: defaultTextTheme.titleLarge,
                  ),
                ),
                SizedBox(height: 16.0),
                MarkdownBody(
                  data: text,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
