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
