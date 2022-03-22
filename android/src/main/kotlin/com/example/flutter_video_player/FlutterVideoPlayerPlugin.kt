package com.example.flutter_video_player

import io.flutter.plugin.common.PluginRegistry.Registrar
import com.example.flutter_video_player.audio.AudioPlayer
import com.example.flutter_video_player.video.PlayerViewFactory

class FlutterVideoPlayerPlugin {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      PlayerViewFactory.registerWith(registrar)
      AudioPlayer.registerWith(registrar)
    }
  }
}
