[How to install flutter sdk](https://docs.flutter.dev/get-started/install)

## Requirements

    1. Flutter Sdk : 3.19.0
    3. emulator / real device with adb debug

## How To Run This Project

```
1. Clone this respoitory
3. Flutter pub get
4. Select build variant
5. Run android emulator / ios
6. Press f5 to start debugging or
flutter run --flavor production -t lib/main_prod.dart
```

## Build APK

1. Staging Debug

   ```
   flutter build apk --split-per-abi -debug --obfuscate --split-debug-info=./split-debug-info-development --flavor staging -t lib/main_dev.dart
   ```

2. Production Release
   ```
   flutter build apk --split-per-abi --obfuscate --split-debug-info=./split-debug-info-development --flavor production -t lib/main_prod.dart
   ```
