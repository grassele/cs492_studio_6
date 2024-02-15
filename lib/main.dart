import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  Map<String,String> forecast = {
    "name": "today",
    "temperature": "35",
    "shortForecast": "Snowy",
    "detailedForecast": "Snowy all day",
    "windSpeed": "10",
    "windDirection": "SE",
    "isDaytime": "true",
    "probabilityOfPercipitation": "100"

  };

  Map<String, String> location = {
    "city": "Bend",
    "state": "Oregon",
    "zip": "97702"
  };

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.lightBlue,
    body: Center(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LocationWidget(location: location),
            TempWidget(forecast: forecast),
            WeatherWidget(forecast: forecast),
            WindRow(forecast: forecast),
          ],
        ),
      ));
  }
}


class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.location,
  });

  final Map<String, String> location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        "${location["city"]}, ${location["state"]} ${location["zip"]}",
        style: const TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }
}


class TempWidget extends StatelessWidget {
  const TempWidget({
    super.key,
    required this.forecast,
  });

  final Map<String, String> forecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("${forecast["temperature"]}˚ F",
        style: const TextStyle(color: Colors.white, fontSize: 75, fontWeight: FontWeight.bold),
      ),
    );
  }
}


class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.forecast,
  });

  final Map<String, String> forecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      color: Colors.white.withOpacity(.2),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.cloudy_snowing, size: 75, color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${forecast["detailedForecast"]}",
              style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}


class WindRow extends StatelessWidget {
  const WindRow({
    super.key,
    required this.forecast,
  });

  final Map<String, String> forecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        color: Colors.white.withOpacity(.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WindIcon(),
            WindText(forecast: forecast),
          ],
        ),
      ),
    );
  }
}


class WindText extends StatelessWidget {
  const WindText({
    super.key,
    required this.forecast,
  });

  final Map<String, String> forecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("${forecast["windSpeed"]} mph ${forecast["windDirection"]}",
        style: const TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}


class WindIcon extends StatelessWidget {
  const WindIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.air, size: 50, color: Colors.white,
      ),
    );
  }
}


