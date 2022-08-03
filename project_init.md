# Project init

## Flutter(Android)のセッティング
1. /flutter_project_nickname/をプロジェクトコードに変更
2. 名前を変更したFlutterフォルダに移動
3. `flutter create --org com.iori.[flutter_project_nickname] --platforms android .`を実行
4. 変更した/flutter_project_nickname/を/flutter/に変更
5. flutter_project_nicknameを検索し、プロジェクトコードに変更

## keyの生成
1. flutterプロジェクトフォルダに移動
2. ```keytool -genkey -v -keystore android/app/release.jks -alias key0 -keyalg RSA -keysize 2048 -validity 10000```
3. ```keytool -importkeystore -srckeystore android/app/release.jks -destkeystore android/app/release.jks -deststoretype pkcs12```
4. android/key.propertiesを"storePassword=xxxxxxx", "keyPassword=xxxxxxx", "keyAlias=key0", "storeFile=release.jks", "serviceAccountFile=service_acount_for_pub.json"で作成
5. `cat flutter/android/app/release.jks | base64`の値をGithubのSettingのActions secrets / New secretに"KEYSTORE_BASE64"として登録
6. "storePassword" > "KEYSTORE_PASSWORD", "keyAlias" > "KEY_ALIAS", "keyPassword" > "KEY_PASSWORD"に同様に登録
7. GCSからpublish用サービスアカウントをダウンロードし、android/service_acount_for_pub.jsonとして保存
8. `cat flutter/android/app/service_account_for_pub.json | base64` の値を"SERVICE_ACCOUNT_KEY_JSON"に同様に登録
9. `cat flutter/android/app/service_account_for_pub.json` の値をSERVICE_ACCOUNT_KEY_JSON_PLAINに登録

## Firebaseの接続
1. "https://console.firebase.google.com/u/0/"に移動して本番用/開発用プロジェクトをそれぞれ作成
2. `dart pub global activate flutterfire_cli`を実行
3. `flutterfire configure --out lib/config/firebase_options_dev.dart --project com-iori-xxxxxxxx-dev --android-app-id com.iori.xxxxxxxx.dev --ios-bundle-id com.iori.xxxxxxxxx.dev`を実行
4. `flutterfire configure --out lib/config/firebase_options.dart --project com-iori-xxxxxxxx --android-app-id com.iori.xxxxxxxx --ios-bundle-id com.iori.xxxxxxxxx`を実行

## Icon/Splashの設定