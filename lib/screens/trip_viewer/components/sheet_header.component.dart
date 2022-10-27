import 'package:flutter/material.dart';
import '../../../constants/strings.constant.dart';

import '../../../widgets/text.widget.dart';

class SheetHeader extends StatefulWidget {
  final Function(int) onChangeIndex;
  final int numItems;
  final String header;
  final VoidCallback onSave;

  const SheetHeader({
    required this.header,
    required this.onChangeIndex,
    required this.numItems,
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  State<SheetHeader> createState() => _SheetHeaderState();
}

class _SheetHeaderState extends State<SheetHeader> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            onPressed: _index == 0
                ? null
                : () {
                    widget.onChangeIndex(_index - 1);
                    setState(() {
                      _index -= 1;
                    });
                  },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        B1Text('${widget.header} ${_index + 1} of ${widget.numItems}'),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            onPressed: _index == widget.numItems - 1
                ? null
                : () {
                    widget.onChangeIndex(_index + 1);
                    setState(() {
                      _index += 1;
                    });
                  },
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        TextButton(
          onPressed: widget.onSave,
          child: const Text(StringConstants.save),
        )
      ],
    );
  }
}
