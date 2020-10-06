import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_provider/weather.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Provider',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Weather(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Heading(),
              Content(),
            ],
          ),
        ),
        floatingActionButton: MyFloatingActionButton(),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<Weather>(context);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        weatherInfo.getTempType,
        style: TextStyle(
          color:  weatherInfo.getTempType == 'celcius' ? Colors.green : Colors.deepOrange,
        ),),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<Weather>(context);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '${weatherInfo.getTempValue}',
        style: TextStyle(
          color:  weatherInfo.getTempType == 'celcius' ? Colors.green : Colors.deepOrange,
        ),
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    
    var weatherInfo = Provider.of<Weather>(context);
    return FloatingActionButton(
      backgroundColor: weatherInfo.getTempType == 'celcius' ? Colors.green : Colors.deepOrange,
      onPressed: (){
        String newWeatherType = weatherInfo.getTempType == 'celcius' ? 'fahrenheit' : 'celcius';
        weatherInfo.temperatureType = newWeatherType;
      },
      tooltip: 'Change Type',
      child: Icon(Icons.change_history)
    );
  }
}




