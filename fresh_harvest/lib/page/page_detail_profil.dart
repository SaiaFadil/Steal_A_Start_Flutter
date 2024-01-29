import 'package:flutter/material.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageDetailProfil extends StatefulWidget {
  @override
  _PageDetailProfilState createState() => _PageDetailProfilState();
}

class _PageDetailProfilState extends State<PageDetailProfil> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Positioned(
              top: 150,
              left: -3,
              right: -3,
              child: Container(
                height: 400,
                child: Card(
                  color: CustomColors.primaryColor,
                  elevation: 100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: CustomColors.primaryColor,
                      width: 4.0,
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/fotosaya.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50.0,
              left: 10.0,
              child: IconButton(
                color: CustomColors.primaryColor,
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

          // Card di tengah halaman
        

//           Positioned(
//             top: 100,
//             left: 0,
//             right: 0,
//             child: Align(
//               alignment: Alignment.center,
//               child: Container(
//                 width: 100.0,
//                 height: 100.0,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: CustomColors.primaryColor,
//                     width: 4.0,
//                   ),
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/fotosaya.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // Bagian atas halaman dengan tombol kembali dan judul
//           Positioned(
//             top: 50.0,
//             left: 10.0,
//             child: IconButton(
//               color: CustomColors.primaryColor,
//               icon: Icon(Icons.arrow_back_ios_new),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
