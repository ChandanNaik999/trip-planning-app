import 'package:flutter/material.dart';

class H1Text extends StatelessWidget {
  final String text;

  const H1Text(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.headline1?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ));
  }
}

class H2Text extends StatelessWidget {
  final String text;

  const H2Text(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.headline2?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ));
  }
}

class H3Text extends StatelessWidget {
  final String text;

  const H3Text(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.headline3?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ));
  }
}

class B1Text extends StatelessWidget {
  final String text;

  const B1Text(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ));
  }
}

class B2Text extends StatelessWidget {
  final String text;

  const B2Text(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ));
  }
}
