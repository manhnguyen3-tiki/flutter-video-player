package com.example.flutter_video_player

import com.example.flutter_video_player.audio.AudioPlayer
import com.example.flutter_video_player.video.PlayerViewFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterVideoPlayerPlugin : FlutterPlugin {

  fun FlutterVideoPlayerPlugin() {}

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      PlayerViewFactory.registerWith(registrar)
      AudioPlayer.registerWith(registrar)
    }
  }

  override fun onAttachedToEngine(binding: FlutterPluginBinding) {
    val plugin = PlayerViewFactory(binding.binaryMessenger, null)
    binding
      .platformViewRegistry
      .registerViewFactory("tv.mta/NativeVideoPlayer", plugin)
  }

  override fun onDetachedFromEngine(binding: FlutterPluginBinding) {}
}
