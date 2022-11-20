#!/bin/bash

virtual_speaker_FL="Gain Virtual Speaker (Stereo):Audio Output 1"
virtual_speaker_FR="Gain Virtual Speaker (Stereo):Audio Output 2"

builtin_audio_FL="alsa_output.pci-0000_00_1b.0.playback.0.0:playback_FL"
builtin_audio_FR="alsa_output.pci-0000_00_1b.0.playback.0.0:playback_FR"

bluetooth_headphones_FL="bluez_output.38_18_4C_18_C8_2D.1:playback_FL"
bluetooth_headphones_FR="bluez_output.38_18_4C_18_C8_2D.1:playback_FR"

bluetooth_speaker_FL="bluez_output.04_21_44_EF_03_70.1:playback_FL"
bluetooth_speaker_FR="bluez_output.04_21_44_EF_03_70.1:playback_FR"

focusrite_FL="alsa_output.usb-Focusrite_Scarlett_2i2_USB-00.playback.0.0:playback_FL"
focusrite_FR="alsa_output.usb-Focusrite_Scarlett_2i2_USB-00.playback.0.0:playback_FR"

connect_builtin_audio () {
    # Disconnect Gain Virtual Speaker to Bluetooth WH-1000XM3 Audio
    pw-link --disconnect "$virtual_speaker_FL" "$bluetooth_headphones_FL"
    pw-link --disconnect "$virtual_speaker_FR" "$bluetooth_headphones_FR"

    # Disconnect Gain Virtual Speaker to Bluetooth SRS-XB43
    pw-link --disconnect "$virtual_speaker_FL" "$bluetooth_speaker_FL"
    pw-link --disconnect "$virtual_speaker_FR" "$bluetooth_speaker_FR"

    # Disconnect Gain Virtual Speaker to Focusrite_Scarlett_2i2_USB
    pw-link --disconnect "$virtual_speaker_FL" "$focusrite_FL"
    pw-link --disconnect "$virtual_speaker_FR" "$focusrite_FR"

    # Connect Gain Virtual Speaker to Built-In Audio
    pw-link "$virtual_speaker_FL" "$builtin_audio_FL"
    pw-link "$virtual_speaker_FR" "$builtin_audio_FR"
}

connect_bluetooth_headset () {
    # Disconnect Gain Virtual Speaker to Built-In Audio
    pw-link --disconnect "$virtual_speaker_FL" "$builtin_audio_FL"
    pw-link --disconnect "$virtual_speaker_FR" "$builtin_audio_FR"

    # Disconnect Gain Virtual Speaker to Bluetooth SRS-XB43
    pw-link --disconnect "$virtual_speaker_FL" "$bluetooth_speaker_FL"
    pw-link --disconnect "$virtual_speaker_FR" "$bluetooth_speaker_FR"

    # Disconnect Gain Virtual Speaker to Focusrite_Scarlett_2i2_USB
    pw-link --disconnect "$virtual_speaker_FL" "$focusrite_FL"
    pw-link --disconnect "$virtual_speaker_FR" "$focusrite_FR"

    # Connect Gain Virtual Speaker to bluetooth WH-1000XM3
    pw-link "$virtual_speaker_FL" "$bluetooth_headphones_FL"
    pw-link "$virtual_speaker_FR" "$bluetooth_headphones_FR"
}

connect_bluetooth_speaker () {
    # Disconnect Gain Virtual Speaker to Built-In Audio
    pw-link --disconnect "$virtual_speaker_FL" "$builtin_audio_FL"
    pw-link --disconnect "$virtual_speaker_FR" "$builtin_audio_FR"

    # Disconnect Gain Virtual Speaker to Bluetooth WH-1000XM3 Audio
    pw-link --disconnect "$virtual_speaker_FL" "$bluetooth_headphones_FL"
    pw-link --disconnect "$virtual_speaker_FR" "$bluetooth_headphones_FR"

    # Disconnect Gain Virtual Speaker to Focusrite_Scarlett_2i2_USB
    pw-link --disconnect "$virtual_speaker_FL" "$focusrite_FL"
    pw-link --disconnect "$virtual_speaker_FR" "$focusrite_FR"

    # Connect Gain Virtual Speaker to Bluetooth SRS-XB43
    pw-link "$virtual_speaker_FL" "$bluetooth_speaker_FL"
    pw-link "$virtual_speaker_FR" "$bluetooth_speaker_FR"
}

connect_focusrite () {
    # Disconnect Gain Virtual Speaker to Built-In Audio
    pw-link --disconnect "$virtual_speaker_FL" "$builtin_audio_FL"
    pw-link --disconnect "$virtual_speaker_FR" "$builtin_audio_FR"

    # Disconnect Gain Virtual Speaker to Bluetooth WH-1000XM3 Audio
    pw-link --disconnect "$virtual_speaker_FL" "$bluetooth_headphones_FL"
    pw-link --disconnect "$virtual_speaker_FR" "$bluetooth_headphones_FR"

    # Disconnect Gain Virtual Speaker to Bluetooth SRS-XB43
    pw-link --disconnect "$virtual_speaker_FL" "$bluetooth_speaker_FL"
    pw-link --disconnect "$virtual_speaker_FR" "$bluetooth_speaker_FR"

    # Connect Gain Virtual Speaker to Focusrite_Scarlett_2i2_USB
    pw-link "$virtual_speaker_FL" "$focusrite_FL"
    pw-link "$virtual_speaker_FR" "$focusrite_FR"
}

while getopts "abcf" option; do
    case $option in
        a)
            connect_builtin_audio
            exit 0
            ;;
        b)
            connect_bluetooth_headset
            exit 0
            ;;
        c)
            connect_bluetooth_speaker
            exit 0
            ;;
        f)
            connect_focusrite
            exit 0
            ;;
        ?)
            echo "script usage: Pass nothing to automatically detect if bluetooth device is connected and connect audio to it, otherwise will connect to the Built-in Audio. Pass -a to connect to Built-in Audio. Pass -b to connect to bluetooth"
            exit 0
            ;;
    esac
done

previous_bluetooth_outputs=$(<~/log_bash_scripts/bluetooth_outputs.log)
actual_bluetooth_outputs=$(pw-link --output | rg "bluez_output" | wc -l)

echo $actual_bluetooth_outputs > ~/log_bash_scripts/bluetooth_outputs.log
echo "Previous value: $previous_bluetooth_outputs"
echo "Actual value: $actual_bluetooth_outputs"

if [[ $actual_bluetooth_outputs != $previous_bluetooth_outputs ]]; then
    if [[ $actual_bluetooth_outputs == 0 ]]; then
        connect_builtin_audio
    else
        connect_bluetooth_headset
    fi
fi
