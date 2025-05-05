# Envelope Waveforms
This code allow the user to download the waveform of a seismic event provided the seismic network, station and time window.

This script (`signal.sh`) is used to process seismic waveforms and extract the envelope function for a given station and event.

## How to Use

Open signal.sh in a text editor and manually update the following information based on your target station and event:
1) Station details (network, station code, location, component)
2) Time window (start time, duration)
3) Filter settings (band-pass limits) -> this one in the script filter_hilbert2.m

Depending on your use case, the script contains multiple processing options (e.g., using different data sources).
You should uncomment the relevant blocks and comment out the others to tailor the execution to your needs.

Once customized, simply run:
sh signal.sh

The script will generate:
1) A filtered waveform file
2) Intermediate processed files (optional, depending on settings)

## Dependencies

1) bash (Unix shell)
2) SAC or ObsPy (depending on the processing backend)
3) wget or curl
4) GNU octave
5) mseed2sac

## Contacts

For questions or issues, contact: giuseppe.petrillo@ntu.edu.sg


   
