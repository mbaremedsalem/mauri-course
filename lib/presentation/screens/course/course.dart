// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:mauricourse/data/localization/langue_constants.dart';
// import 'package:mauricourse/presentation/components/default_buttom.dart';
// import 'package:mauricourse/presentation/constants/constants.dart';
// import 'package:mauricourse/size_config.dart';

// class Course extends StatefulWidget {
//   const Course({super.key});

//   @override
//   State<Course> createState() => _CourseState();
// }

// class _CourseState extends State<Course> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 18),
//         child: SafeArea(
//           child: Column(
//           children: [
//             Container(
//                     color: whitecolor,
//                     child: Row(
//                       children: [
//                         Image.asset('assets/images/logo.png',
//                         width: getProportionateScreenWidth(90),),
//                         const Spacer(),
//                         Text(
//                           getTranslated(context, "pageAceuile")!,
//                           style: const TextStyle(
//                             color: primarycolor,
//                             fontWeight: FontWeight.w500,fontSize: 30,
//                           ),
//                           ),
//                       ],
//                     ),
//                   ),
//             Container(
//             width: 440,
//             child: Stack(
//               // mainAxisAlignment: MainAxisAlignment.end,
//               alignment: AlignmentDirectional.centerEnd,
//               children: [
//                 Align(
//                   alignment: AlignmentDirectional.topStart,
//                   child: Container(
//                     height: 60,
//                     width: 350,
//                     child: DefaultButton(
//                                   onTap: () {
//                                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>const Onboarding()));
//                                     // setState(() {
//                                     //   index = 1;
//                                     // });
//                                   },
//                                   color: primarycolor,
//                                   textcolor: whitecolor,
//                                   text: getTranslated(context, "M'bare Mohamed Salem")!,
//                                   // hasIcon: true,
                                  
//                                 ),
//                   ),
//                 ),
              
                
//                    const CircleAvatar(radius: 50,
//                    backgroundImage: NetworkImage('https://thumbs.dreamstime.com/b/profile-anonymous-face-icon-gray-silhouette-person-male-businessman-profile-default-avatar-photo-placeholder-isolated-white-113133662.jpg'),
//                    )
//               ],
//             ),
//           ),
//             SizedBox(height: 40,),
//           Card(
//             color: primarycolor,
//             child: Container(
//               height: getProportionateScreenHeight(100),
//               width: double.infinity,
             
//             ),
//           )
//           ],
//         )),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mauricourse/data/localization/langue_constants.dart';
import 'package:mauricourse/presentation/constants/constants.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  final TextEditingController _controllermessage = TextEditingController();
  FlutterSoundRecorder? _recorder;
  bool _isRecording = false;
  String? _recordedFilePath;

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    _initializeRecorder();
    
    // Use a direct video file URL for the video player
    _controller = VideoPlayerController.network(
      'https://www.w3schools.com/html/mov_bbb.mp4', // Replace with your direct video URL
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  Future<void> _initializeRecorder() async {
    await _recorder!.openAudioSession();
    await _requestMicrophonePermission();
  }

  Future<void> _requestMicrophonePermission() async {
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }
  }

  void _startRecording() async {
    try {
      _recordedFilePath = 'audio_recording.aac'; // Set the expected file path manually
      await _recorder!.startRecorder(
        toFile: _recordedFilePath,
        codec: Codec.aacADTS,
      );
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      print('Error starting recording: $e');
    }
  }

  void _stopRecording() async {
    try {
      await _recorder!.stopRecorder();
      setState(() {
        _isRecording = false;
      });
    } catch (e) {
      print('Error stopping recording: $e');
    }
  }

  @override
  void dispose() {
    _recorder!.closeAudioSession();
    _controllermessage.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    String message = _controllermessage.text.trim();
    if (message.isNotEmpty) {
      print('Sending text message: $message');
      _controllermessage.clear();
      // Add your message sending logic here
    }
  }

  void _sendVoiceMessage() {
    if (_recordedFilePath != null) {
      File audioFile = File(_recordedFilePath!);
      print('Sending voice message: ${audioFile.path}');
      // Add your voice message sending logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 18),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Image.asset('assets/images/logo.png', width: 90),
                    const Spacer(),
                    Text(
                      getTranslated(context, "Page de cours live ")!,
                      style:  const TextStyle(
                        color: primarycolor,
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 440,
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Container(
                        height: 60,
                        width: 350,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                          backgroundColor: primarycolor,
                          ),
                          child: Text(getTranslated(context, "M'bare Mohamed Salem")!,style: TextStyle(color: whitecolor),),
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://thumbs.dreamstime.com/b/profile-anonymous-face-icon-gray-silhouette-person-male-businessman-profile-default-avatar-photo-placeholder-isolated-white-113133662.jpg',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Center(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controllermessage,
                      decoration: InputDecoration(
                        hintText: 'Enter your message...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                  IconButton(
                    icon: Icon(_isRecording ? Icons.stop : Icons.mic),
                    onPressed: () {
                      if (_isRecording) {
                        _stopRecording();
                        _sendVoiceMessage();
                      } else {
                        _startRecording();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

