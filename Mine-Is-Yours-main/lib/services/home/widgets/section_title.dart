import 'package:flutter/material.dart';

import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_widgets.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
      child: Row(
        children: [
          FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: '',
            options: FFButtonOptions(
              width: 12,
              height: 40,
              color: Colors.black,
              textStyle:
                  FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: 8,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4, 8, 0, 8),
            child: Text(
              title, /* Recently Given Books */
              style: FlutterFlowTheme.of(context).subtitle1.override(
                    fontFamily: 'Libre Baskerville',
                    color: Colors.black,
                    fontSize: 22,
                  ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
                icon: const Icon(Icons.arrow_forward),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
