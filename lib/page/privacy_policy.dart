import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bottonbar.dart';
import '../navItem.dart';
import '../style.dart';
import '../topbar.dart';

String text =
    'นโยบายความเป็นส่วนตัวของเว็บไซต์พีเจเฮ้าส์\n\n1. วัตถุประสงค์ในการประมวลผลข้อมูลส่วนบุคคล เว็บไซต์ที่สร้างโดยผู้พัฒนานี้ประมวลผลข้อมูลส่วนบุคคลเพื่อวัตถุประสงค์ดังต่อไปนี้ และไม่ได้ใช้เพื่อวัตถุประสงค์อื่นนอกเหนือจากวัตถุประสงค์ดังต่อไปนี้\n\n1) วัตถุประสงค์ในการขายโครงการที่บริษัทขาย หรือใช้สำหรับสอบถามและปรึกษาผู้ซื้อ\n\n2. การส่งมอบการประมวลผลข้อมูลส่วนบุคคล\nแอปของนักพัฒนาซอฟต์แวร์นี้ไม่มอบความไว้วางใจให้บริษัทอื่นดำเนินการจัดการข้อมูลส่วนบุคคล\n\n3. สิทธิและหน้าที่ของเจ้าของข้อมูลและวิธีการใช้ในเรื่องของข้อมูลส่วนบุคคล ผู้ใช้สามารถใช้สิทธิ์ที่เกี่ยวข้องกับการคุ้มครองข้อมูลส่วนบุคคลได้ตลอดเวลา\nอย่างไรก็ตาม ไซต์นี้รวบรวมและเก็บรักษาข้อมูลการใช้งานของผู้ใช้ไซต์เพื่อวัตถุประสงค์ในการให้คำปรึกษาเท่านั้น\n\n4. กรอกรายการข้อมูลส่วนบุคคลที่จะดำเนินการ\nเราประมวลผลรายการข้อมูลส่วนบุคคลต่อไปนี้\n\nหมายเลขโทรศัพท์: ใช้สำหรับสอบถามข้อมูลผลิตภัณฑ์และคำปรึกษาLine ID : ใช้สำหรับสอบถามและปรึกษาสินค้า\n\n5. การทำลายข้อมูลส่วนบุคคล\nเราไม่รวบรวมหรือเก็บข้อมูลการใช้งานของผู้ใช้แอป ดังนั้นเราจึงไม่มีข้อมูลส่วนบุคคลที่ต้องทำลาย\n\n6. มาตรการเพื่อความปลอดภัยของข้อมูลส่วนบุคคล\nเราไม่รวบรวมหรือเก็บข้อมูลการใช้งานของผู้ใช้แอป';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      endDrawer: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 180, maxWidth: 190),
        child: NavItem(),
      ),
      drawerEnableOpenDragGesture: false,
      body: Container(
        color: logoBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TopBar(),
              PrivacyPolicyScreen(),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: isDesktop(context) ? DeviceSize.getWidth(context)*0.7 : isTab(context) ? DeviceSize.getWidth(context)*0.8 : DeviceSize.getWidth(context)*0.9,
        child: Column(
          children: [
            Container(
              width: isDesktop(context) ? DeviceSize.getWidth(context)*0.7 : isTab(context) ? DeviceSize.getWidth(context)*0.8 : DeviceSize.getWidth(context)*0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: topBarTextColor,
                    ),
                  ),
                  Text(
                    "PJ House นโยบายความเป็นส่วนตัว",
                    style: GoogleFonts.prompt(
                      color: topBarTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: IconButton(
                      onPressed: () {
                        null;
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: topBarTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              height: 1,
              width: isDesktop(context) ? DeviceSize.getWidth(context)*0.7 : isTab(context) ? DeviceSize.getWidth(context)*0.8 : DeviceSize.getWidth(context)*0.9,
              color: home2ColorLine,
            ),
            SizedBox(height: 50.0),
            getText(),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }

  Widget getText() {
    List<Widget> textlist = [];
    List<String> textsplit = text.split("\n\n");
    int count = text.split("\n\n").length;
    for (int i = 0; i < count; i++) {
      if (textsplit[i].contains("\n")) {
        for (int i2 = 0; i2 < textsplit[i].split("\n").length; i2++) {
          textlist.add(Text(textsplit[i].split("\n")[i2]));
        }
        textlist.add(Text("\n"));
      } else {
        textlist.add(Text(textsplit[i]));
        textlist.add(Text("\n"));
      }
    }
    return Column(
      children: textlist, crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}

/*
นโยบายความเป็นส่วนตัวของเว็บไซต์พีเจเฮ้าส์

1. วัตถุประสงค์ในการประมวลผลข้อมูลส่วนบุคคล เว็บไซต์ที่สร้างโดยผู้พัฒนานี้ประมวลผลข้อมูลส่วนบุคคลเพื่อวัตถุประสงค์ดังต่อไปนี้ และไม่ได้ใช้เพื่อวัตถุประสงค์อื่นนอกเหนือจากวัตถุประสงค์ดังต่อไปนี้

1) วัตถุประสงค์ในการขายโครงการที่บริษัทขาย หรือใช้สำหรับสอบถามและปรึกษาผู้ซื้อ

2. การส่งมอบการประมวลผลข้อมูลส่วนบุคคล
แอปของนักพัฒนาซอฟต์แวร์นี้ไม่มอบความไว้วางใจให้บริษัทอื่นดำเนินการจัดการข้อมูลส่วนบุคคล

3. สิทธิและหน้าที่ของเจ้าของข้อมูลและวิธีการใช้
ในเรื่องของข้อมูลส่วนบุคคล ผู้ใช้สามารถใช้สิทธิ์ที่เกี่ยวข้องกับการคุ้มครองข้อมูลส่วนบุคคลได้ตลอดเวลา
อย่างไรก็ตาม ไซต์นี้รวบรวมและเก็บรักษาข้อมูลการใช้งานของผู้ใช้ไซต์เพื่อวัตถุประสงค์ในการให้คำปรึกษาเท่านั้น

4. กรอกรายการข้อมูลส่วนบุคคลที่จะดำเนินการ
เราประมวลผลรายการข้อมูลส่วนบุคคลต่อไปนี้

หมายเลขโทรศัพท์: ใช้สำหรับสอบถามข้อมูลผลิตภัณฑ์และคำปรึกษา
Line ID : ใช้สำหรับสอบถามและปรึกษาสินค้า

5. การทำลายข้อมูลส่วนบุคคล
เราไม่รวบรวมหรือเก็บข้อมูลการใช้งานของผู้ใช้แอป ดังนั้นเราจึงไม่มีข้อมูลส่วนบุคคลที่ต้องทำลาย

6. มาตรการเพื่อความปลอดภัยของข้อมูลส่วนบุคคล
เราไม่รวบรวมหรือเก็บข้อมูลการใช้งานของผู้ใช้แอป
 */

/*
นโยบายความเป็นส่วนตัวของเว็บไซต์พีเจเฮ้าส์\n\n1. วัตถุประสงค์ในการประมวลผลข้อมูลส่วนบุคคล เว็บไซต์ที่สร้างโดยผู้พัฒนานี้ประมวลผลข้อมูลส่วนบุคคลเพื่อวัตถุประสงค์ดังต่อไปนี้ และไม่ได้ใช้เพื่อวัตถุประสงค์อื่นนอกเหนือจากวัตถุประสงค์ดังต่อไปนี้\n\n1) วัตถุประสงค์ในการขายโครงการที่บริษัทขาย หรือใช้สำหรับสอบถามและปรึกษาผู้ซื้อ\n\n2. การส่งมอบการประมวลผลข้อมูลส่วนบุคคล\nแอปของนักพัฒนาซอฟต์แวร์นี้ไม่มอบความไว้วางใจให้บริษัทอื่นดำเนินการจัดการข้อมูลส่วนบุคคล\n\n3. สิทธิและหน้าที่ของเจ้าของข้อมูลและวิธีการใช้ในเรื่องของข้อมูลส่วนบุคคล ผู้ใช้สามารถใช้สิทธิ์ที่เกี่ยวข้องกับการคุ้มครองข้อมูลส่วนบุคคลได้ตลอดเวลา\nอย่างไรก็ตาม ไซต์นี้รวบรวมและเก็บรักษาข้อมูลการใช้งานของผู้ใช้ไซต์เพื่อวัตถุประสงค์ในการให้คำปรึกษาเท่านั้น\n\n\n4. กรอกรายการข้อมูลส่วนบุคคลที่จะดำเนินการ\nเราประมวลผลรายการข้อมูลส่วนบุคคลต่อไปนี้\n\nหมายเลขโทรศัพท์: ใช้สำหรับสอบถามข้อมูลผลิตภัณฑ์และคำปรึกษาLine ID : ใช้สำหรับสอบถามและปรึกษาสินค้า\n\n5. การทำลายข้อมูลส่วนบุคคล\nเราไม่รวบรวมหรือเก็บข้อมูลการใช้งานของผู้ใช้แอป ดังนั้นเราจึงไม่มีข้อมูลส่วนบุคคลที่ต้องทำลาย\n\n6. มาตรการเพื่อความปลอดภัยของข้อมูลส่วนบุคคล\nเราไม่รวบรวมหรือเก็บข้อมูลการใช้งานของผู้ใช้แอป
 */
