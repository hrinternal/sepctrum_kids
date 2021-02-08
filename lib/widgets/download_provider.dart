// import 'dart:io';
// import 'dart:isolate';
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class DownloadProvider extends ChangeNotifier {
//   bool _permissionReady = false;
//   String _localPath;
//
//   final _dbphelper = DatabaseHelper();
//
//   void bindBackgroundIsolate() {
//     ReceivePort _port = ReceivePort();
//     bool isSuccess = IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
//     if (!isSuccess) {
//       unbindBackgroundIsolate();
//       bindBackgroundIsolate();
//       return;
//     }
//
//     _port.asBroadcastStream().listen((dynamic data) async {
//       // if (debug) {
//       //   print('UI Isolate Callback: $data');
//       // }
//       String id = data[0];
//       DownloadTaskStatus status = data[1];
//       int progress = data[2];
//
//       final task =
//           await _dbphelper.getallbooks()?.then((value) => value.firstWhere((task) => task.downloadedbookId == id));
//       if (task != null) {
//         task.status = status.value;
//         task.progress = progress;
//         notifyListeners();
//       }
//     });
//   }
//
//   void unbindBackgroundIsolate() {
//     IsolateNameServer.removePortNameMapping('downloader_send_port');
//   }
//
//   static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
//     // if (debug) {
//     //   print('Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
//     // }
//     final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port');
//     send.send([id, status, progress]);
//   }
//
//   // Widget buildNoPermissionWarning() => Container(
//   //       child: Center(
//   //         child: Column(
//   //           mainAxisSize: MainAxisSize.min,
//   //           crossAxisAlignment: CrossAxisAlignment.center,
//   //           children: [
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//   //               child: Text(
//   //                 'Please grant accessing storage permission to continue -_-',
//   //                 textAlign: TextAlign.center,
//   //                 style: TextStyle(color: Colors.blueGrey, fontSize: 18.0),
//   //               ),
//   //             ),
//   //             SizedBox(
//   //               height: 32.0,
//   //             ),
//   //             FlatButton(
//   //                 onPressed: () {
//   //                   _checkPermission().then((hasGranted) {
//   //                     setState(() {
//   //                       _permissionReady = hasGranted;
//   //                     });
//   //                   });
//   //                 },
//   //                 child: Text(
//   //                   'Retry',
//   //                   style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
//   //                 ))
//   //           ],
//   //         ),
//   //       ),
//   //     );
//
//   void requestDownload({BookDetails bookDetails}) async {
//     String taskId = await FlutterDownloader.enqueue(
//         url: bookDetails.download_link,
//         // fileName: bookDetails.bookTitle.trim(),
//         savedDir: _localPath,
//         showNotification: true,
//         openFileFromNotification: true);
//     _dbphelper.updatebook(
//       book: BookDetails(
//           book_author: bookDetails.book_author,
//           book_description: bookDetails.book_description,
//           book_id: bookDetails.book_id,
//           downloadedbookId: taskId,
//           status: bookDetails.status,
//           progress: bookDetails.progress,
//           front_cover: bookDetails.front_cover,
//           date_published: bookDetails.date_published,
//           download_link: bookDetails.download_link,
//           book_publisher: bookDetails.book_publisher,
//           book_title: bookDetails.book_title),
//     );
//     notifyListeners();
//     // task.taskId = await FlutterDownloader.enqueue(
//     //     url: task.link,
//     //     headers: {"auth": "test_for_sql_encoding"},
//     //     savedDir: _localPath,
//     //     showNotification: true,
//     //     openFileFromNotification: true);
//   }
//
//   void cancelDownload({BookDetails bookDetails}) async {
//     await FlutterDownloader.cancel(taskId: bookDetails.downloadedbookId);
//   }
//
//   void pauseDownload({BookDetails bookDetails}) async {
//     await FlutterDownloader.pause(taskId: bookDetails.downloadedbookId);
//   }
//
//   void resumeDownload({BookDetails bookdetails}) async {
//     String newTaskId = await FlutterDownloader.resume(taskId: bookdetails.downloadedbookId);
//     _dbphelper.updatebook(
//       book: BookDetails(
//           book_author: bookdetails.book_author,
//           book_description: bookdetails.book_description,
//           book_id: bookdetails.book_id,
//           downloadedbookId: newTaskId,
//           status: bookdetails.status,
//           progress: bookdetails.progress,
//           front_cover: bookdetails.front_cover,
//           date_published: bookdetails.date_published,
//           download_link: bookdetails.download_link,
//           book_publisher: bookdetails.book_publisher,
//           book_title: bookdetails.book_title),
//     );
//     notifyListeners();
//   }
//
//   void retryDownload({BookDetails bookdetails}) async {
//     String newTaskId = await FlutterDownloader.retry(taskId: bookdetails.downloadedbookId);
//     _dbphelper.updatebook(
//       book: BookDetails(
//           book_author: bookdetails.book_author,
//           book_description: bookdetails.book_description,
//           book_id: bookdetails.book_id,
//           downloadedbookId: newTaskId,
//           status: bookdetails.status,
//           progress: bookdetails.progress,
//           front_cover: bookdetails.front_cover,
//           date_published: bookdetails.date_published,
//           download_link: bookdetails.download_link,
//           book_publisher: bookdetails.book_publisher,
//           book_title: bookdetails.book_title),
//     );
//     notifyListeners();
//   }
//
//   Future<bool> openDownloadedFile({BookDetails bookDetails}) {
//     return FlutterDownloader.open(taskId: bookDetails.downloadedbookId);
//   }
//
//   Future<DownloadTask> getDownloadPath({String taskid}) async {
//     final tasks = await FlutterDownloader.loadTasks();
//     print(tasks.where((element) => element.taskId == taskid).elementAt(0).savedDir);
//     return tasks.where((element) => element.taskId == taskid).elementAt(0);
//   }
//
//   void delete({BookDetails bookDetails}) async {
//     await FlutterDownloader.remove(taskId: bookDetails.downloadedbookId, shouldDeleteContent: true);
//     await prepare();
//     notifyListeners();
//   }
//
//   Future<bool> _checkPermission() async {
//     if (Platform.isAndroid) {
//       final status = await Permission.storage.status;
//       if (status != PermissionStatus.granted) {
//         final result = await Permission.storage.request();
//         if (result == PermissionStatus.granted) {
//           return true;
//         }
//       } else {
//         return true;
//       }
//     } else {
//       return true;
//     }
//     return false;
//   }
//
//   Future<Null> prepare() async {
//     final tasks = await FlutterDownloader.loadTasks();
//
//     tasks?.forEach((task) async {
//       final bookDetails = await _dbphelper.getallbooks();
//       for (BookDetails bookdetails in bookDetails) {
//         if (bookdetails.download_link == task.url) {
//           _dbphelper.updatebook(
//             book: BookDetails(
//                 book_author: bookdetails.book_author,
//                 book_description: bookdetails.book_description,
//                 book_id: bookdetails.book_id,
//                 downloadedbookId: task.taskId,
//                 status: task.status.value,
//                 progress: task.progress,
//                 front_cover: bookdetails.front_cover,
//                 date_published: bookdetails.date_published,
//                 download_link: bookdetails.download_link,
//                 book_publisher: bookdetails.book_publisher,
//                 book_title: bookdetails.book_title),
//           );
//           notifyListeners();
//         }
//       }
//     });
//
//     _permissionReady = await _checkPermission();
//
//     _localPath = (await _findLocalPath()) + Platform.pathSeparator + 'download';
//     notifyListeners();
//
//     final savedDir = Directory(_localPath);
//     bool hasExisted = await savedDir.exists();
//     if (!hasExisted) {
//       savedDir.create();
//     }
//   }
//
//   Future<String> _findLocalPath() async {
//     final directory =
//         Platform.isAndroid ? await getApplicationSupportDirectory() : await getApplicationDocumentsDirectory();
//     return directory.path;
//   }
// }
