import 'package:fasih_ai/firebase_options.dart';
import 'package:fasih_ai/src/app.dart';
import 'package:fasih_ai/src/exceptions/async_error_logger.dart';
import 'package:fasih_ai/src/exceptions/error_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // turn off the # in the URLs on the web
  usePathUrlStrategy();
  // final localCartRepository = await SembastCartRepository.makeDefault();
  // // * Create ProviderContainer with any required overrides
  // final container = ProviderContainer(
  //   overrides: [
  //     localCartRepositoryProvider.overrideWithValue(localCartRepository),
  //   ],
  //   observers: [AsyncErrorLogger()],
  // );
  // * Initialize CartSyncService to start the listener
  // container.read(cartSyncServiceProvider);
  // final errorLogger = container.read(errorLoggerProvider);
  // * Register error handlers. For more info, see:
  // * https://docs.flutter.dev/testing/errors
  // final errorLogger = container.read(errorLoggerProvider);
  // registerErrorHandlers(errorLogger);
  // * Entry point of the app
  // runApp(UncontrolledProviderScope(
  //   container: container,
  //   child: const MyApp(),
  // ));
  // runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      observers: [AsyncErrorLogger()],
      child: const MyApp(),
    ),
  );
}

void registerErrorHandlers(ErrorLogger errorLogger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
