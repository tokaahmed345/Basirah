<!DOCTYPE html>
<html lang="en" dir="ltr">



  <section>
    <h2>  📖 Overview</h2>
    <p>
      <b>👁️ Basirah</b> is an app that uses the camera and generative AI to help blind or low-vision users
      understand their surroundings naturally and instantly, without complicated buttons or steps.
      The user asks by voice, and the app replies by voice too — like a continuous, natural conversation.
    </p>
  </section>

  <section>
    <h2>🔄 User Flow</h2>
    <div class="flow-steps">
      <div class="flow-step">
        <div class="num">1</div>
        <div class="content">
          <b>Open the app</b><br>
          The camera starts automatically in the background — no button needed — and a welcome voice message instantly guides the user to point the camera and ask anytime.
        </div>
      </div>
      <div class="flow-step">
        <div class="num">2</div>
        <div class="content">
          <b>Listening</b><br>
          The app stays ready to listen, or a simple "tap to ask" button can be used instead of continuous listening to save battery.
        </div>
      </div>
      <div class="flow-step">
        <div class="num">3</div>
        <div class="content">
          <b>Processing</b><br>
          A photo is captured from the camera and sent along with the spoken text to the AI model, which automatically understands the type of question (scene description, text reading, color details, etc.) without the user specifying it.
        </div>
      </div>
      <div class="flow-step">
        <div class="num">4</div>
        <div class="content">
          <b>Response</b><br>
          The app automatically replies by voice, then returns to listening mode, ready for the next question with no manual action needed.
        </div>
      </div>
    </div>
  </section>


https://github.com/user-attachments/assets/1512b75f-5301-4acb-8d5e-10f983612571



  <section>
    <h2>⚙️ Core Dependencies</h2>
    <table>
      <tr><th>Package</th><th>Purpose</th></tr>
      <tr><td><code>camera</code></td><td>Camera control and image capture</td></tr>
      <tr><td><code>speech_to_text</code></td><td>Converts user speech into text</td></tr>
      <tr><td><code>flutter_tts</code></td><td>Converts the AI's reply into speech</td></tr>
      <tr><td><code>google_generative_ai</code></td><td>Connects to Gemini to analyze the image + question</td></tr>
      <tr><td><code>flutter_bloc</code></td><td>App state management (listening / processing / speaking)</td></tr>
      <tr><td><code>go_router</code></td><td>Screen navigation</td></tr>
      <tr><td><code>get_it</code></td><td>Dependency injection</td></tr>
      <tr><td><code>dio</code></td><td>Network requests</td></tr>
      <tr><td><code>dartz</code></td><td>Functional error handling (Either)</td></tr>
      <tr><td><code>flutter_dotenv</code></td><td>Loads environment variables like API keys</td></tr>
      <tr><td><code>image</code></td><td>Processes images before sending to the model</td></tr>
    </table>
  </section>

  <section>
    <h2>🧠 Assistant States</h2>
    <p>The UI automatically reacts to the Cubit's state:</p>
    <ul>
      <li><code>AssistantStatus.listening</code> — the app is ready to hear a new question</li>
      <li><code>AssistantStatus.processing</code> — image and voice are being analyzed by the AI</li>
      <li><code>AssistantStatus.speaking</code> — the answer is being spoken, with full text shown on screen</li>
    </ul>
    <div class="note">
      The design is fully voice-first; the visual UI is only a supporting layer for users who can see part of the screen.
    </div>
  </section>

  <section>
    <h2>🗂️ Project Structure</h2>
    <div class="tree">
lib/
├── core/
│   ├── utils/
│   │   ├── colors/app_colors.dart
│   │   └── constant/enums.dart
│   └── ...
├── feature/
│   └── home/
│       ├── data/
│       │   └── datasources/
│       │       └── vision_ai_remote_data_source.dart
│       └── presentation/
│           ├── cubit/
│           │   └── voice_assistant_cubit.dart
│           ├── view/
│           │   └── home_view_body.dart
│           └── widgets/
│               ├── home_status_panel.dart
│               ├── listening_status_view.dart
│               ├── processing_status_panel.dart
│               └── speaking_status_view.dart
└── main.dart
    </div>
  </section>

  <section>
    <h2>🔌 Example: Calling the AI Model</h2>
    <pre><code>final content = [
  Content.multi([
    TextPart(question),
    DataPart('image/jpeg', imageBytes),
  ]),
];

final response = await model.generateContent(content);
return response.text ?? 'Sorry, I could not understand that.';</code></pre>
    <p>This function takes the user's text question plus the captured image bytes, sends them together to the Gemini model, and returns the reply as text, which is then converted to speech.</p>
  </section>

  <section>
    <h2>🚀 Getting Started</h2>
    <ol>
      <li>Clone the repository</li>
      <li>Run <code>flutter pub get</code></li>
      <li>Create a <code>.env</code> file in the project root and add your Gemini API key</li>
      <li>Run the app on a physical device (camera is usually unavailable on emulators)</li>
      <li>Grant camera and microphone permissions when prompted</li>
    </ol>
  </section>

  <section>
    <h2>🌟 Future Improvements</h2>
    <ul>
      <li>Multi-language voice replies</li>
      <li>A battery-saving mode that reduces continuous listening</li>
      <li>Storing recent answers for later review</li>
      <li>Offline support for simple tasks like reading text</li>
    </ul>
  </section>

  <footer>
    Basirah — Made with Flutter &amp; ❤️ for accessibility
  </footer>

</div>
</body>
</html>
