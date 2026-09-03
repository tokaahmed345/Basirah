<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Basirah — AI Voice Assistant App</title>
<style>
  :root {
    --bg: #0d1117;
    --surface: #161b22;
    --surface-2: #1c2128;
    --border: #30363d;
    --text: #e6edf3;
    --text-dim: #9198a1;
    --accent: #58a6ff;
    --accent-2: #3fb950;
    --code-bg: #0a0e14;
  }
  * { box-sizing: border-box; }
  body {
    margin: 0;
    background: var(--bg);
    color: var(--text);
    font-family: "Segoe UI", Tahoma, Arial, sans-serif;
    line-height: 1.8;
  }
  .wrapper {
    max-width: 900px;
    margin: 0 auto;
    padding: 40px 24px 80px;
  }
  header {
    text-align: center;
    padding: 48px 24px;
    background: linear-gradient(180deg, rgba(88,166,255,0.12), transparent);
    border-radius: 16px;
    margin-bottom: 40px;
  }
  header .logo { font-size: 48px; margin-bottom: 12px; }
  header h1 { margin: 0; font-size: 2.2rem; color: var(--accent); }
  header p { color: var(--text-dim); font-size: 1.05rem; margin-top: 8px; }
  .badges { margin-top: 16px; display: flex; gap: 8px; justify-content: center; flex-wrap: wrap; }
  .badge {
    background: var(--surface-2);
    border: 1px solid var(--border);
    color: var(--text-dim);
    padding: 4px 12px;
    border-radius: 20px;
    font-size: 0.8rem;
  }
  section { margin-bottom: 40px; }
  h2 {
    color: var(--accent);
    border-bottom: 1px solid var(--border);
    padding-bottom: 10px;
    font-size: 1.4rem;
  }
  h3 { color: var(--text); font-size: 1.1rem; margin-top: 24px; }
  p, li { color: var(--text-dim); }
  ul, ol { padding-left: 24px; }
  li { margin-bottom: 6px; }
  code {
    background: var(--code-bg);
    color: var(--accent-2);
    padding: 2px 6px;
    border-radius: 4px;
    font-family: "Fira Code", Consolas, monospace;
    font-size: 0.9em;
  }
  pre {
    background: var(--code-bg);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 16px;
    overflow-x: auto;
  }
  pre code { background: none; padding: 0; color: #c9d1d9; }
  .flow-steps { display: flex; flex-direction: column; gap: 14px; }
  .flow-step {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 16px 20px;
    display: flex;
    align-items: flex-start;
    gap: 16px;
  }
  .flow-step .num {
    background: var(--accent);
    color: #0d1117;
    font-weight: bold;
    min-width: 32px;
    height: 32px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
  }
  .flow-step .content b { color: var(--text); }
  table { width: 100%; border-collapse: collapse; background: var(--surface); border-radius: 10px; overflow: hidden; }
  th, td { padding: 10px 14px; border-bottom: 1px solid var(--border); text-align: left; }
  th { background: var(--surface-2); color: var(--accent); }
  td { color: var(--text-dim); }
  .tree {
    background: var(--code-bg);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 16px;
    font-family: "Fira Code", Consolas, monospace;
    font-size: 0.9rem;
    color: #c9d1d9;
    overflow-x: auto;
  }
  .note {
    background: rgba(88,166,255,0.08);
    border-left: 4px solid var(--accent);
    padding: 14px 18px;
    border-radius: 8px;
    color: var(--text-dim);
  }
  footer {
    text-align: center;
    color: var(--text-dim);
    font-size: 0.85rem;
    margin-top: 60px;
    padding-top: 20px;
    border-top: 1px solid var(--border);
  }
</style>
</head>
<body>
<div class="wrapper">

  <header>
    <div class="logo">👁️</div>
    <h1>Basirah</h1>
    <p>An AI-powered voice assistant app that helps visually impaired users understand their surroundings</p>
    <div class="badges">
      <span class="badge">Flutter</span>
      <span class="badge">Gemini AI</span>
      <span class="badge">Accessibility</span>
      <span class="badge">Voice Assistant</span>
    </div>
  </header>

  <section>
    <h2>📖 Overview</h2>
    <p>
      <b>Basirah</b> is an app that uses the camera and generative AI to help blind or low-vision users
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