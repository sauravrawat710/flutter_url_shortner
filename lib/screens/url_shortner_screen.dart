import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_shortner/screens/url_shortner_state.dart';

class UrlShortnerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<UrlShortnerState>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Text(
              'URL Shortner',
              style: TextStyle(
                fontSize: 40,
                color: Colors.blue[400],
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Shorten your long URL quickly',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 32),
            TextField(
              controller: state.urlController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Paste the link',
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: state.shortUrlMessage))
                    .whenComplete(
                  () => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Link is Copied'),
                    ),
                  ),
                );
              },
              child: Text(state.shortUrlMessage),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: state.handleGetLinkButton,
                child: Text('GET LINK'),
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                  shape: MaterialStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.white,
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
