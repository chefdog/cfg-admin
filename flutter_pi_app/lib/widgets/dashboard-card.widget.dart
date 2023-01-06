import 'package:flutter/material.dart';
import 'package:flutter_pi_app/models/result-system-information.model.dart';
import 'package:flutter_pi_app/widgets/sub-title.widget.dart';
import 'section-title.widget.dart';

// class DashboardCarWidget extends StatelessWidget {
//   const DashboardCarWidget({Key? key, required this.model}) : super(key: key);

//   final SystemInformation model;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       bottom: false,
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           children: [
//             SectionTitle(title: model.machineName),
//             const SubTitle(title: ''),
//           ],
//         ),
//       ),
//     );
//   }
// }

class DashboardCardWidget extends StatelessWidget {
  const DashboardCardWidget(
      {Key? key, required this.title, required this.image})
      : super(key: key);

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      elevation: 8.0,
      margin: const EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              image,
              height: MediaQuery.of(context).size.width * (3 / 4),
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 38.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
