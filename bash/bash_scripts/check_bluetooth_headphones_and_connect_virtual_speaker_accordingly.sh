#!/bin/bash

connect_builtin_audio () {
    # Disconnect Gain Virtual Speaker to Bluetooth WH-1000XM3 Audio
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 1" bluez_output.38_18_4C_18_C8_2D.1:playback_FL
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 2" bluez_output.38_18_4C_18_C8_2D.1:playback_FR

    # Disconnect Gain Virtual Speaker to Bluetooth SRS-XB43
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 1" bluez_output.04_21_44_EF_03_70.1:playback_FL
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 2" bluez_output.04_21_44_EF_03_70.1:playback_FR

    # Disconnect Gain Virtual Speaker to Focusrite_Scarlett_2i2_USB
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 1" alsa_output.usb-Focusrite_Scarlett_2i2_USB-00.playback.0.0:playback_FL
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 2" alsa_output.usb-Focusrite_Scarlett_2i2_USB-00.playback.0.0:playback_FR

    # Connect Gain Virtual Speaker to Built-In Audio
    pw-link "Gain Virtual Speaker (Stereo):Audio Output 1" alsa_output.pci-0000_00_1b.0.playback.0.0:playback_FL
    pw-link "Gain Virtual Speaker (Stereo):Audio Output 2" alsa_output.pci-0000_00_1b.0.playback.0.0:playback_FR
}

connect_bluetooth_headset () {
    # Disconnect Gain Virtual Speaker to Built-In Audio
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 1" alsa_output.pci-0000_00_1b.0.playback.0.0:playback_FL
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 2" alsa_output.pci-0000_00_1b.0.playback.0.0:playback_FR

    # Disconnect Gain Virtual Speaker to Bluetooth SRS-XB43
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 1" bluez_output.04_21_44_EF_03_70.1:playback_FL
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 2" bluez_output.04_21_44_EF_03_70.1:playback_FR

    # Disconnect Gain Virtual Speaker to Focusrite_Scarlett_2i2_USB
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 1" alsa_output.usb-Focusrite_Scarlett_2i2_USB-00.playback.0.0:playback_FL
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 2" alsa_output.usb-Focusrite_Scarlett_2i2_USB-00.playback.0.0:playback_FR

    # Connect Gain Virtual Speaker to bluetooth WH-1000XM3
    pw-link "Gain Virtual Speaker (Stereo):Audio Output 1" bluez_output.38_18_4C_18_C8_2D.1:playback_FL
    pw-link "Gain Virtual Speaker (Stereo):Audio Output 2" bluez_output.38_18_4C_18_C8_2D.1:playback_FR
}

connect_bluetooth_speaker () {
    # Disconnect Gain Virtual Speaker to Built-In Audio
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 1" alsa_output.pci-0000_00_1b.0.playback.0.0:playback_FL
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 2" alsa_output.pci-0000_00_1b.0.playback.0.0:playback_FR

    # Disconnect Gain Virtual Speaker to Bluetooth WH-1000XM3 Audio
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 1" bluez_output.38_18_4C_18_C8_2D.1:playback_FL
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 2" bluez_output.38_18_4C_18_C8_2D.1:playback_FR

    # Disconnect Gain Virtual Speaker to Focusrite_Scarlett_2i2_USB
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 1" alsa_output.usb-Focusrite_Scarlett_2i2_USB-00.playback.0.0:playback_FL
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 2" alsa_output.usb-Focusrite_Scarlett_2i2_USB-00.playback.0.0:playback_FR

    # Connect Gain Virtual Speaker to Bluetooth SRS-XB43
    pw-link "Gain Virtual Speaker (Stereo):Audio Output 1" bluez_output.04_21_44_EF_03_70.1:playback_FL
    pw-link "Gain Virtual Speaker (Stereo):Audio Output 2" bluez_output.04_21_44_EF_03_70.1:playback_FR
}

connect_focusrite () {
    # Disconnect Gain Virtual Speaker to Built-In Audio
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 1" alsa_output.pci-0000_00_1b.0.playback.0.0:playback_FL
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 2" alsa_output.pci-0000_00_1b.0.playback.0.0:playback_FR

    # Disconnect Gain Virtual Speaker to Bluetooth WH-1000XM3 Audio
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 1" bluez_output.38_18_4C_18_C8_2D.1:playback_FL
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 2" bluez_output.38_18_4C_18_C8_2D.1:playback_FR

    # Disconnect Gain Virtual Speaker to Bluetooth SRS-XB43
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 1" bluez_output.04_21_44_EF_03_70.1:playback_FL
    pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 2" bluez_output.04_21_44_EF_03_70.1:playback_FR

    # Connect Gain Virtual Speaker to Focusrite_Scarlett_2i2_USB
    pw-link "Gain Virtual Speaker (Stereo):Audio Output 1" alsa_output.usb-Focusrite_Scarlett_2i2_USB-00.playback.0.0:playback_FL
    pw-link "Gain Virtual Speaker (Stereo):Audio Output 2" alsa_output.usb-Focusrite_Scarlett_2i2_USB-00.playback.0.0:playback_FR
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
