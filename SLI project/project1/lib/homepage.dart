import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

//home page////////////////////////////////////////////
class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> {
  void _navigateToHomePage() {
    // Add your navigation logic here, for example:
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {// Replace this with the widget for the next page
          return const HomePage();
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: const BoxDecoration(
       // image: DecorationImage(
          //image: AssetImage('assets/login.png'),
         // fit: BoxFit.cover,
       // ),
     // ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 90, right: 40, top: 30),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 550,
                      ),
                      Text(
                        'SIGNEASE',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35),
              padding: const EdgeInsets.only(left: 45, top: 650),
              child: const Text(
                'welcome back!',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 45, right: 35),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 300,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Get Started',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blue,
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: _navigateToHomePage,
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/////////////home screen////////////////////////////////////////////////////////////////
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();

}

class HomePageState extends State<HomePage> {

  void _navigateToCamPage() {
    // Add your navigation logic here, for example:
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {// Replace this with the widget for the next page
          return const CameraBox(cameras: [],);
        },
      ),
    );
  }
  void _navigateToLearnPage() {
    // Add your navigation logic here, for example:
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {// Replace this with the widget for the next page
          return const LearnPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: const BoxDecoration(
        //image: DecorationImage(
          //image: AssetImage('assets/login.png'),
          //fit: BoxFit.cover,
        //),
      //),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'SignEase',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 400),
              ElevatedButton(
                onPressed: _navigateToCamPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Change the button color
                  foregroundColor: Colors.white, // Change the text color
                  textStyle: const TextStyle(
                    fontSize: 26, // Change the text size
                    fontWeight: FontWeight.w700, // Change the text style
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(300, 100), // Set the button size
                ),
                child: const Text('Open Camera'),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: _navigateToLearnPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Change the button color
                  foregroundColor: Colors.white, // Change the text color
                  textStyle: const TextStyle(
                    fontSize: 26, // Change the text size
                    fontWeight: FontWeight.w700, // Change the text style
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(300, 100), // Set the button size
                ),
                child: const Text('Learn To Sign'),
              ),

              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _navigateToLearnPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Change the button color
                      foregroundColor: Colors.white, // Change the text color
                      textStyle: const TextStyle(
                        fontSize: 16, // Change the text size
                        fontWeight: FontWeight.w700, // Change the text style
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(50, 50), // Set the button size
                    ),
                    child: const Text('Developer'),
                  ),
                  ElevatedButton(
                    onPressed: _navigateToLearnPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Change the button color
                      foregroundColor: Colors.white, // Change the text color
                      textStyle: const TextStyle(
                        fontSize: 16, // Change the text size
                        fontWeight: FontWeight.w700, // Change the text style
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(50, 50), // Set the button size
                    ),
                    child: const Text('Need Help?'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////CAM PAGE//////////////////////////////////////////////

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraScreen({Key? key, required this.cameras}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late int _selectedCameraIndex; // Added for tracking the selected camera index

  @override
  void initState() {
    super.initState();
    _selectedCameraIndex = 0; // Initially use the first camera (back camera)
    _controller = CameraController(
      widget.cameras[_selectedCameraIndex],
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _toggleCamera() async {
    await _controller.dispose();
    setState(() {
      // Toggle between the front and back cameras
      _selectedCameraIndex = (_selectedCameraIndex + 1) % widget.cameras.length;
      _controller = CameraController(
        widget.cameras[_selectedCameraIndex],
        ResolutionPreset.medium,
      );
      _initializeControllerFuture = _controller.initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Magic'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: _toggleCamera,
            child: const Icon(Icons.switch_camera),
          ),
        ],
      ),
    );
  }

}

class CameraBox extends StatelessWidget {
  final List<CameraDescription> cameras;
  const CameraBox({Key? key, required this.cameras}) : super(key: key);  // Fix constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CameraScreen(cameras: cameras),
    );
  }
}



////////////////////////LEARN PAGE /////////////////////////////////////////
class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  LearnPageState createState() => LearnPageState();

}

class LearnPageState extends State<LearnPage> {

  void _navigateToTest() {
    // Add your navigation logic here, for example:
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {// Replace this with the widget for the next page
          return const Test();
        },
      ),
    );
  }

  void _navigateToPractice() {
    // Add your navigation logic here, for example:
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {// Replace this with the widget for the next page
          return const Practice();
        },
      ),
    );
  }

  void _navigateToFlashcards() {
    // Add your navigation logic here, for example:
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {// Replace this with the widget for the next page
          return const Flashcards();
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        //decoration: const BoxDecoration(
          //image: DecorationImage(
            //image: AssetImage('assets/login.png'),
            //fit: BoxFit.cover,
          //),
        //),
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'Learn to Sign',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              backgroundColor: Colors.blue,
              iconTheme: const IconThemeData(color: Colors.white),
              automaticallyImplyLeading: true,
            ),
            body: Stack(
              children: [
                Container(),

                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 55, right: 35),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: _navigateToFlashcards,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue, // Change the button color
                                  foregroundColor: Colors.white, // Change the text color
                                  textStyle: const TextStyle(
                                    fontSize: 30, // Change the text size
                                    fontWeight: FontWeight.w700, // Change the text style
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  minimumSize: const Size(300, 100), // Set the button size
                                ),
                                child: const Text(' Learn ISL '),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: _navigateToFlashcards,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue, // Change the button color
                                  foregroundColor: Colors.white, // Change the text color
                                  textStyle: const TextStyle(
                                    fontSize: 30, // Change the text size
                                    fontWeight: FontWeight.w700, // Change the text style
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  minimumSize: const Size(300, 100), // Set the button size
                                ),
                                child: const Text(' Learn ASL '),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: _navigateToFlashcards,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue, // Change the button color
                                  foregroundColor: Colors.white, // Change the text color
                                  textStyle: const TextStyle(
                                    fontSize: 30, // Change the text size
                                    fontWeight: FontWeight.w700, // Change the text style
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  minimumSize: const Size(300, 100), // Set the button size
                                ),
                                child: const Text(' Flashcards '),
                              ),

                              const SizedBox(
                                height: 20,
                              ),

                              ElevatedButton(
                                onPressed: _navigateToPractice,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue, // Change the button color
                                  foregroundColor: Colors.white, // Change the text color
                                  textStyle: const TextStyle(
                                    fontSize: 30, // Change the text size
                                    fontWeight: FontWeight.w700, // Change the text style
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  minimumSize: const Size(300, 100), // Set the button size
                                ),
                                child: const Text(' Practice '),
                              ),

                              const SizedBox(
                                height: 20,
                              ),

                              ElevatedButton(
                                onPressed: _navigateToTest,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue, // Change the button color
                                  foregroundColor: Colors.white, // Change the text color
                                  textStyle: const TextStyle(
                                    fontSize: 30, // Change the text size
                                    fontWeight: FontWeight.w700, // Change the text style
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  minimumSize: const Size(300, 100), // Set the button size
                                ),
                                child: const Text(' Test Yourself '),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }
}

////////////////////Flashcards//////////////////////////////////////////////
class Flashcards extends StatefulWidget {
  const Flashcards({Key? key}) : super(key: key);

  @override
  FlashcardsState createState() => FlashcardsState();
}

class FlashcardsState extends State<Flashcards> {
  final List<Flashcard> flashcards = [
    Flashcard(
      question: 'Question 1',
      answer: 'Answer 1',
      imagePath: 'assets/logo.png', // Provide the image path
    ),
    Flashcard(
      question: 'Question 2',
      answer: 'Answer 2',
      imagePath: 'assets/image2.png', // Provide the image path
    ),
    // Add more flashcards with image paths
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flashcards',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _FlashcardWidget(flashcard: flashcards[currentIndex]),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(
                  onPressed: showAnswer,
                  child: const Text('Show Answer'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: showNextFlashcard,
                  child: const Text('Next'),
                ),

              ],
            ),
          ]
      ),
    );

  }

  void showNextFlashcard() {
    setState(() {
      currentIndex = (currentIndex + 1) % flashcards.length;
    });
  }

  void showAnswer() {
    final currentFlashcard = flashcards[currentIndex];
    final snackBar = SnackBar(
      content: Text('Answer: ${currentFlashcard.answer}'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class Flashcard {
  final String question;
  final String answer;
  final String imagePath;

  Flashcard({required this.question, required this.answer, required this.imagePath});
}

class _FlashcardWidget extends StatelessWidget {
  final Flashcard flashcard;

  const _FlashcardWidget({required this.flashcard});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              flashcard.imagePath, // Use the image path from the Flashcard
              width: 100, // Adjust the image width as needed
              height: 100, // Adjust the image height as needed
            ),
            const SizedBox(height: 10), // Add spacing between image and text
            Text(
              "What is the Translation for this Sign?\n${flashcard.question}",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}


///////////////////////////PRACTICE////////////////////////////////////////
class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  PracticeState createState() => PracticeState();
}

class PracticeState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: const BoxDecoration(
        //image: DecorationImage(
          //image: AssetImage('assets/bkgrd.png'),
          //fit: BoxFit.cover,
        //),
      //),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Practice',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true,
        ),
      ),
    );
  }
}

//////////////////////////////TEST////////////////////////////////////////

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  TestState createState() => TestState();
}

class TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Camera - Test',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
      ),
    );
  }
}

