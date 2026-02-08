extends Node

# AudioManager class to manage sound effects and background music

class_name AudioManager

var background_music : AudioStreamPlayer
var sound_effects : Dictionary

func _ready():
    background_music = AudioStreamPlayer.new()  # Create background music player
    add_child(background_music)
    sound_effects = {}  # Initialize sound effects dictionary

func play_background_music(music_stream : AudioStream):
    background_music.stream = music_stream
    background_music.play()

func stop_background_music():
    background_music.stop()

func load_sound_effect(name : String, sound_stream : AudioStream):
    sound_effects[name] = sound_stream

func play_sound_effect(name : String):
    if name in sound_effects:
        var sound_player = AudioStreamPlayer.new()
        sound_player.stream = sound_effects[name]
        add_child(sound_player)
        sound_player.play()
        sound_player.connect("finished", sound_player, "queue_free")  # Free node after playing
