import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test App'),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(width: 100, height: 100, child: Icon(CupertinoIcons.person)),
        Text('The Name'),
        SizedBox(height: 100),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 1, color: Colors.blue),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}


// Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: 120,
//             height: 120,
//             color: Colors.red,
//             child: Center(
//                 child: Text(
//               'Hello',
//               style: TextStyle(fontSize: 20, color: Colors.blue),
//             ),
//            ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.black,
//               ),
              // TextButton(
              //   child: Center(child: Text('press'),),
              //   style: TextButton.styleFrom(backgroundColor: Colors.blue,),
              //   onPressed: () {},
              // ),
//               Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.black,
//               ),
//             ],
//           ),
//           Container(
//             width: 120,
//             height: 120,
//             color: Colors.blue,
//             child: Center(
//                 child: Text(
//               'World',
//               style: TextStyle(fontSize: 20, color: Colors.red),
//             )),
//           ),
//         ],
//       )





// Center(
//         child: Container(
//           width: 250,
//           height: 250,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(width: 1),
//           ),
//           child: Center(
//             child: Text('Hello Wolrd'),
//           ),
//         ),
//       )

      // Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         TextButton(
      //           child: Text(
      //             'press me 1',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           onPressed: () {},
      //           style: TextButton.styleFrom(
      //             primary: Colors.purple,
      //             backgroundColor: Colors.green,
      //             elevation: 10,
      //           ),
      //         ),
      //         ElevatedButton(
      //           child: Text(
      //             'press me 2',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           onPressed: () {},
      //           style: ElevatedButton.styleFrom(
      //             primary: Colors.black,
      //             onPrimary: Colors.amber,
      //             onSurface: Colors.green,
      //             elevation: 20,
      //           ),
      //         ),
      //       ],
      //     )
// Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 color: Colors.amber,
//                 width: 100,
//                 height: 100,
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 color: Colors.black,
//                 width: 100,
//                 height: 100,
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 color: Colors.blue,
//                 width: 100,
//                 height: 100,
//               ),
//             ],
//           ),
//         ],
//       ),