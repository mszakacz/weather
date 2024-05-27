# Weather Mobile App

## App Overview
Mobile app presents Weather Forecast for 5 next days. 

<img src="https://github.com/mszakacz/weather/assets/38291070/92f78bb9-b427-4d9a-bd4e-965980a77bad" width="300">
<!-- ![Simulator Screenshot - iPhone 15 Pro - 2024-05-27 at 11 53 12](https://github.com/mszakacz/weather/assets/38291070/92f78bb9-b427-4d9a-bd4e-965980a77bad) -->


## API KEY
### Weather API Key
1) Get your own API Key from https://openweathermap.org/api [OpenWeatherMap](https://openweathermap.org/api)
2) Create `api_keys.json` at the very top level of the project and store there the API Key
<pre>{
    "WEATHER_API_KEY": "9cbc5c33f21d66891d89e3e61ed55509"
}</pre>
3) Use `--dart-define` to pass the API Key to the build
e.g: `flutter run --dart-define-from-file=api_keys.json`

4) Make sure that `api_keys.json` is added to `.gitignore`

5) And/Or add it to your build configuration:
<pre>{
      "name": "Launch development",
      "request": "launch",
      "type": "dart",
      "program": "lib/main_development.dart",
      "args": [
        "--flavor",
        "development",
        "--target",
        "lib/main_development.dart"
      ],
      "toolArgs": [
        "--dart-define-from-file=api_keys.json"
      ]
    }</pre>

<hr style="border:2px solid gray">

## Build the app
###### iOS Release Production  
`flutter build ipa --release lib/main_production.dart --dart-define-from-file=api_keys.json`

###### Android Release Production  
`flutter build aab --release lib/main_production.dart --dart-define-from-file=api_keys.json`

###### iOS Debug Development 
`flutter build ipa --debug lib/main_development.dart --dart-define-from-file=api_keys.json`

###### Android Debug Development 
`flutter build aab --debug lib/main_development.dart --dart-define-from-file=api_keys.json`
<hr style="border:2px solid gray">


## Test
To test the app and all packages simply run 
`flutter test . packages/*`
<hr style="border:2px solid gray">


## Weather API docs
https://openweathermap.org/forecast5
