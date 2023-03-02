import 'package:ecommerce/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWidget extends ConsumerWidget {
  /// Creating a variable called nonSignedInBuilder and signedInBuilder.
  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder signedInBuilder;
  final WidgetBuilder adminSignedInBuilder;

  /// A constructor.
  const AuthWidget({
    required this.nonSignedInBuilder,
    required this.signedInBuilder,
    required this.adminSignedInBuilder,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Watching the authStateChangesProvider.
    final authStateChanges = ref.watch(authStateChangesProvider);
    // I am storing this somewhere else on production
    const adminEmail = "admin@admin.com";
    return authStateChanges.when(
      /// Showing a circular progress indicator when the app is loading.
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator()
        ),  
      ),
      data: (user) => user != null ? user.email == adminEmail ? adminSignedInBuilder(context) : signedInBuilder(context) : nonSignedInBuilder(context),
      /// Showing a text that says "Something went wrong!" if there is an error.
      error: (_, __) => const Scaffold(
        body: Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}