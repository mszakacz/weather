# Weather Mobile App

## App Overview
Mobile app presents Weather Forecast for 5 next days. 

<img height="600" alt="Screenshot 2024-05-28 at 12 47 29" src="https://github.com/mszakacz/weather/assets/38291070/b7ec4c75-902e-4ffa-9dc7-be6bc20e8c5d">
<img height="600" alt="Screenshot 2024-05-28 at 12 47 04" src="https://github.com/mszakacz/weather/assets/38291070/a1cfc705-5c2b-48f6-9bed-8f8a61e5d8fb">


## API KEY
### Weather API Key
1) Get your own API Key from https://openweathermap.org/api [OpenWeatherMap](https://openweathermap.org/api)
2) Create `api_keys.json` at the very top level of the project and store there the API Key
<pre>{
    "WEATHER_API_KEY": "< your_API_KEY >"
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
