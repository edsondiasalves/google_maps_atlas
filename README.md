[![codecov](https://codecov.io/gh/edsondiasalves/google_maps_atlas/branch/main/graph/badge.svg?token=EJHHDWK3DR)](https://codecov.io/gh/edsondiasalves/google_maps_atlas)

<h1>An Atlas map provided by Google</h1>

## Getting Started

### Clone the project:
* `git clone https://github.com/edsondiasalves/google_maps_atlas.git`
### Enter in the root directory: 
- `cd google_maps_atlas`
### Download the root dependencies:
* `flutter pub get`
* ### Enter in the example project:
* `cd example`
### Download the example dependencies:
* `flutter pub get`
### Set the credentials
#### For getting your API Key sign up to the [Google Cloud](https://cloud.google.com/)
#### Ios:
> In the `ios/Runner/AppDelegate.swift` file change the highlighted value
```
GMSServices.provideAPIKey("[PUT YOUR API KEY HERE]")
```

#### Android:
> In the `app/src/main/AndroidManifest.xml` file change the API Key

```
<application
        android:name="io.flutter.app.FlutterApplication"
        android:label="google_maps_atlas"
        android:icon="@mipmap/ic_launcher">

        <meta-data android:name="com.google.android.geo.API_KEY"
            android:value="[PUT YOUR API KEY HERE]"/>

```
### Run the project:
* `flutter run lib/main.dart`