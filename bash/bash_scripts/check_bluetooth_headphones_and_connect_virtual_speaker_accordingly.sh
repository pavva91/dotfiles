#!/bin/bash

previous_bluetooth_outputs=$(<~/log_bash_scripts/bluetooth_outputs.log)
actual_bluetooth_outputs=$(pw-link --output | rg "bluez_output" | wc -l)

echo $actual_bluetooth_outputs > ~/log_bash_scripts/bluetooth_outputs.log
echo "Previous value: $previous_bluetooth_outputs"
echo "Actual value: $actual_bluetooth_outputs"

if [[ $actual_bluetooth_outputs != $previous_bluetooth_outputs ]]; then
    if [[ $actual_bluetooth_outputs == 0 ]]; then
        # Connect Gain Virtual Speaker to Built-In Audio
        pw-link "Gain Virtual Speaker (Stereo):Audio Output 1" alsa_output.pci-0000_00_1b.0.playback.0.0:playback_FL
        pw-link "Gain Virtual Speaker (Stereo):Audio Output 2" alsa_output.pci-0000_00_1b.0.playback.0.0:playback_FR
    else
        # Disconnect Gain Virtual Speaker to Built-In Audio
        pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 1" alsa_output.pci-0000_00_1b.0.playback.0.0:playback_FL
        pw-link --disconnect "Gain Virtual Speaker (Stereo):Audio Output 2" alsa_output.pci-0000_00_1b.0.playback.0.0:playback_FR

        # Connect Gain Virtual Speaker to bluetooth WH-1000XM3
        pw-link "Gain Virtual Speaker (Stereo):Audio Output 1" bluez_output.38_18_4C_18_C8_2D.1:playback_FL
        pw-link "Gain Virtual Speaker (Stereo):Audio Output 2" bluez_output.38_18_4C_18_C8_2D.1:playback_FR
    fi
fi
