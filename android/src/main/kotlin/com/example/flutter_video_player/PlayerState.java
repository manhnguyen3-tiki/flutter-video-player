package com.example.flutter_video_player;

public enum PlayerState {
    IDLE,
    BUFFERING,
    PLAYING,
    PAUSED,
    COMPLETE;

    private PlayerState() {
    }
}