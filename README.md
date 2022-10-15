# insta_extractor
This plugin lets you download instagram reels, igtv, posts, stories <br>

![Pub Version](https://img.shields.io/pub/v/insta_extractor) 
![License](https://img.shields.io/github/license/TamilKannanCV-personal/insta_extractor)

## What we can download?
- Reels
- igtv
- Stories
- Posts

## Example
```dart
    // Login to get the credentials
    await InstaExtractor.setCookies(userId, sessionId, csrftoken);

    final storyDetails = await InstaExtractor.getDetails(
                    "https://instagram.com/stories/xxxyyyzzz/2694xxxyyyzzz61989?utm_medium=share_sheet")
```

<br>

---

## Migration to 1.0.0
from<br>
`InstaExtractor.getStories()`
<br>
to<br>
 `InstaExtractor.getDetails()`

---

 ## Contributing
If you have read up till here, then 🎉🎉🎉. There are couple of ways in which you can contribute to
the growing comunity of `insta_extractor.dart` .
- Pick up any issue marked with ["good first issue"](https://github.com/Tami1KannanCV-persona1/insta_extractor/issues?q=is%3Aissue+is%3Aopen+1abe1%3A%22good+first+issue%22)
- Propose any feature, enhancement
- Report a bug
- Fix a bug
- Write and improve some **documentation**. Documentation is super critical and its importance
  cannot be overstated!