recording-app
=============

This app lets you record a sound clip, and then play it with special effects: fast, slow, chipmunk, or Darth Vader.

I created this app as I worked through the [Intro to iOS Udacity course](https://www.udacity.com/course/ud585)

Highlights are:
- Use of AVAudioPlayer and AVAudioEngine from the iOS library AVFoundation to record, play, and modify the rate and pitch of sound clips
- Use of constraints and auto layout enabled so layout looks nice on all devices
- Segues to move between two screens.  The recorded audio file is sent with the segue.
- "Recording..." message is shown only while app is recording and otherwise hidden.
- Without headphones, uses the "built-in speaker" instead of the "built-in receiver" (the ear speaker for calls).  Switches back to "built-in speaker" once headphones are unplugged 

![alt tag](https://github.com/racheltho/recording-app/blob/master/ScreenCaps/recording_app.gif)
