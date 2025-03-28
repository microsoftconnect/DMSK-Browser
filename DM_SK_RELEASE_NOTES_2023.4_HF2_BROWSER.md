# Release Notes for Dragon Medical SpeechKit 2023\.4 Hotfix 2 (Browser edition 5\.4 R1 HF2\)

## Solved issues in version 2023\.4 Hotfix 2 (5\.4 R1 HF2\)

* Fixed a memory leak; multiple instances of the Nuance PowerMic Web Extension event listener are no longer added to the page. \[1639212]
* Fixed the font sizes in the Nuance PowerMic Web Extension installation prompt. \[1639212]

## Important information

* This release is only available in the Nuance cloud.
* CKEditor edit controls are no longer supported.
* For the personalization and help window to work on Firefox browsers, users must disable the Enhanced Tracking Protection feature. See: [https://support.mozilla.org/en\-US/kb/enhanced\-tracking\-protection\-firefox\-desktop](https://support.mozilla.org/en-US/kb/enhanced-tracking-protection-firefox-desktop)
* Web browsers on mobile operating systems are not supported.
* Dragon Medical SpeechKit (Browser edition) requires HTTPS with an SSL/TLS certificate bound to the web server.
* Dragon Medical SpeechKit 2023\.4 (Browser edition) is compatible with Dragon Medical Server 2022\.4 and 2023\.x.
* Dragon Medical Server 2023\.4 is compatible with client versions 2022\.4 and 2023\.x.
* Filtering auto\-texts (defining filters to deactivate auto\-texts selectively) is deprecated and will no longer work.
* Do not change or hide Browser edition GUI elements. Changing or hiding these elements risks the stability and compatibility of the product; Nuance cannot provide support for such integrations.
* Web browser debugging consoles or debugging proxies (for example, Fiddler) cannot be used with speech recognition. The performance impact incurred by such infrastructure leads to unreliable speech recognition.
* Corrections made by transcriptionists are not used for author profile adaptation.

## Supported edit controls

* HTML `<input>` and `<textarea>` controls.
* `<div>` elements that have the HTML5 `contenteditable` attribute set to `true`.

### Cursor position in a content\-editable div

When the user places the focus in a content\-editable div (for example, by pressing the tab key or saying navigation commands), Dragon Medical SpeechKit does not interfere with the browser's default handling of setting the selection. Exception: When the div is focused for the first time, the cursor is placed at the end of the text.

The browser default can vary but the cursor is often placed at the start of the control rather than the end. To override the browser's default handling and place the text cursor at the end of the text, do the following:

* In the `NUSA_configure` function, set `NUSA_contentEditableDefaultSelection = false;`

**Note:** The user can say a text selection voice command and immediately move the focus away from the content\-editable div (before Dragon Medical SpeechKit has processed the command and selected the text). When the user moves the focus back to the div, the text will be selected; the text cursor will not be placed at the end of the div.

## Known issues

* In Google Chrome and Mozilla Firefox the page must be refreshed if the microphone is unplugged and plugged in again. \[DNB\-4123, DNB\-18532]
* Nuance PowerMic in Citrix and VMware environments (Nuance\-hosted systems only): When opening a speech\-enabled page, there can be a delay before microphone buttons are available, from a few seconds up to half a minute depending on the network connection. This only occurs in Citrix and VMware environments; it does not occur when the user opens the page in a local browser. \[CAVE\-6198]
* Transcriptionists' last used audio position for a document is not reset when authors modify the audio. \[DNB\-49647]
* Hotkeys for syncing audio/text might not work. Users who change hotkey configurations must include SHIFT in the combination. For users who have never changed hotkey combinations (such as via the Desktop SDK), the Browser SDK default hotkeys (CTRL\+ALT\+A and CTRL\+ALT\+T) work correctly as long as they are not set manually. This issue will be resolved when DMS 2023\.2 is deployed in the Nuance data centers. \[DNB\-49129]

## Infrastructure

### Infrastructure no longer supported

* Dragon Medical SpeechKit and Dragon Medical Embedded 2023\.4 applications do not work with version 2021 servers.
* Version 2021 client applications do not work with version 2023\.4 servers.

### Infrastructure changes planned for the next release

* Dragon Medical SpeechKit and Dragon Medical embedded 2024 and higher will not work with version 2022 servers.
* Version 2022 client applications will not work with version 2024 servers.

## System requirements

### Supported browsers

| Component | Operating system | Recommended\* browser version |
|-|-|-|
| Google Chrome | Windows | 119 |
| Mozilla Firefox | Windows | 119 |
| Microsoft Edge | Windows\*\* | 119 |
| Apple Safari | macOS | 17\.0 |

\* Recommended browser versions are the versions we used to test this release.

\*\* Foot pedals not supported until Nuance Edge Web Extension is released.

Other operating system and browser combinations might work but are not officially supported by Nuance. For example, Linux browsers or Chrome and Firefox with macOS.

### Audio configuration in virtualized environments

Hardware and software requirements depend on the audio system and configuration. Supported audio systems are listed below:

| Component | Audio system | Configuration | Bandwidth requirements |
|-|-|-|-|
| Citrix environments | HDX audio | Audio quality must be set to high (Citrix XenApp default: medium) | 150 kbit/sec |
|  | USB redirection | Nuance\-hosted systems: Full audio and button control support\* On\-premises systems: Audio support only | 400 kbit/sec |
| VMware environments | Real\-Time Audio\-Video (RTAV) | Default | 200 kbit/sec or higher |
|  | USB redirection | Nuance\-hosted systems: Full audio and button control support\* On\-premises systems: Audio support only | 1\.4 Mbit/sec |
| RDS environments | RDS audio | Default | Approximately 1\.4 Mbit/sec |

\* If you have configured USB redirection, the Nuance PowerMic Citrix/VMWare Extension is not required to enable button controls.

**Note:** Dragon Medical SpeechKit (Browser edition) does not work with the Nuance Citrix/RDS/VMware Virtual Audio Extensions; the virtualized environment's native audio channels must be used.

### Supported microphones

#### Audio

Dragon Medical SpeechKit requires a microphone which records audio data with a bit depth of 16\-bit and a sampling rate of at least 16 kHz.

#### Button controls

Nuance\-hosted systems only: Support for button controls is listed below:

| Component | Local browser | Citrix XenApp | Citrix XenDesktop | Microsoft RDS | VMware Horizon View |
| --- | --- | --- | --- | --- | --- |
| Nuance PowerMic II | yes\* | yes\*\* | yes\*\* | no | yes\*\* |
| Nuance PowerMic III | yes\* | yes\*\* | yes\*\* | no | yes\*\* |
| Nuance PowerMic 4 | yes\* | yes\*\* | yes\*\* | no | yes\*\* |

\* Your application must be running in Google Chrome on a Windows operating system. The Nuance PowerMic Web Extension must be installed in Google Chrome and the Nuance PowerMic Web Adapter must be running on the operating system.

\*\* Your application must be running in Google Chrome on a Windows operating system. The Nuance PowerMic Web Extension must be installed in Google Chrome and the Nuance PowerMic Web Adapter must be running on the operating system. The Nuance PowerMic Citrix/RDS/VMware Client Extension must be installed on the client endpoint.

### Supported foot controls

| Manufactuer | Foot pedals | Transcription sets |
| --- | --- | --- |
| Philips | ACC 2310ACC 2320ACC 2330 | LFH 5220/03LFH 2210LFH 2305 |
| VEC | VEC IN\-USB and InfinityVEC IN\-USB\-2 |  |

## System requirements \- virtualized environments

| Component | Recommended | Supported |
|-|-|-|
| Nuance virtual extensions: Client | 123\.2\.506\.0 | 121\.4\.136\.2138 \- 123\.2\.506\.0 |
| VMware Horizon View |  | VMware Horizon View 7: VMware Horizon View Agent 7\.13 or higher VMware Horizon Client 5\.5 or higher<br><br>Protocols: PCoIP, Blast Extreme, Real\-Time Audio\-Video (RTAV) |
| Citrix Virtual Apps and Desktops |  | Citrix XenApp and XenDesktop: 7\.15 or higher<br><br>Citrix Virtual Apps and Desktops: 1912 LTSR or higher |
| Citrix Client |  | Citrix Workspace app: 1912 or higher |
| Remote Desktop Services | Windows Server 2019 | Windows Server 2016 Windows Server 2019 Windows Server 2022 |
| Remote Desktop Client | Windows 11 | Windows 10 Windows 11 |
| Linux thin clients |  | IGEL (For information on the IGEL thin clients supported, search for Nuance compatibility in the [IGEL Knowledge Base](https://kb.igel.com/endpoint-os-886693.html).) |

### Remarks

* For more information on virtualized environments; for example, instructions on setting up see the **Docs \& Guidelines** folder of the Nuance virtual extensions package on the [Nuance Healthcare Development Platform](http://www.nuancehealthcaredeveloper.com/).
* Citrix environments: Make sure you uninstall the Nuance PowerMic Web Extension before installing the latest version. For more information, see the *Nuance PowerMic Web Extension Deployment Guide*.

### End\-of\-life: third party environments

Support for third party environments is only valid as long as they are supported by the corresponding vendor and might be subject to other restrictions. Please contact Nuance Technical Support for details. For more information, see the documentation delivered with the third party product and supporting Nuance documentation.

When standard support by the vendor has stopped, Nuance will continue support if an issue is specific to the Nuance solution, within the limitations of the vendor's standard end\-of\-life and Nuance's policy. This means that issues that are a combination of the vendor’s component and the Nuance solution cannot be supported.

## Release channels

Dragon Medical SpeechKit (Browser edition) is provided on the following release channels: Beta, Mainline and Delayed. You should have these three channels configurable for your integration. Rather than changing your integration to test different versions, you only need to switch your test installations to Beta.

### Beta channel

The Beta channel is the version in development. Use this channel to verify that your application works with the upcoming version of Dragon Medical SpeechKit (Browser edition).

| Dragon Medical Server location | Localized Dragon Medical SpeechKit (Browser edition) URL |
| --- | --- |
| Australia | `https://speechanywhere.nuancehdp.com/beta/scripts/Nuance.SpeechAnywhere.au.js` |
| Canada | `https://speechanywhere.nuancehdp.com/beta/scripts/Nuance.SpeechAnywhere.ca.js` |
| France | `https://speechanywhere.nuancehdp.com/beta/scripts/Nuance.SpeechAnywhere.fr.js` |
| Germany | `https://speechanywhere.nuancehdp.com/beta/scripts/Nuance.SpeechAnywhere.de.js` |
| UK | `https://speechanywhere.nuancehdp.com/beta/scripts/Nuance.SpeechAnywhere.uk.js` |
| US | `https://speechanywhere.nuancehdp.com/beta/scripts/Nuance.SpeechAnywhere.js` |

### Mainline channel

The Mainline channel is the official release version. Use this channel to integrate the latest official release version of Dragon Medical SpeechKit (Browser edition).

| Dragon Medical Server location | Localized Dragon Medical SpeechKit (Browser edition) URL |
| --- | --- |
| Australia | `https://speechanywhere.nuancehdp.com/mainline/scripts/Nuance.SpeechAnywhere.au.js` |
| Canada | `https://speechanywhere.nuancehdp.com/mainline/scripts/Nuance.SpeechAnywhere.ca.js` |
| France | `https://speechanywhere.nuancehdp.com/mainline/scripts/Nuance.SpeechAnywhere.fr.js` |
| Germany | `https://speechanywhere.nuancehdp.com/mainline/scripts/Nuance.SpeechAnywhere.de.js` |
| UK | `https://speechanywhere.nuancehdp.com/mainline/scripts/Nuance.SpeechAnywhere.uk.js` |
| US | `https://speechanywhere.nuancehdp.com/mainline/scripts/Nuance.SpeechAnywhere.js` |

### Delayed channel

The Delayed channel is one version previous to the Mainline channel. This channel is updated once a new major version of the Browser SDK is available. Use this channel to downgrade one version from the Mainline channel. If critical issues that affect your integration occur on the Mainline channel, please report them to Nuance technical support so that they can be resolved for the next Mainline release.

| Dragon Medical Server location | Localized Dragon Medical SpeechKit (Browser edition) URL |
| --- | --- |
| Australia | `https://speechanywhere.nuancehdp.com/delayed/scripts/Nuance.SpeechAnywhere.au.js` |
| Canada | `https://speechanywhere.nuancehdp.com/delayed/scripts/Nuance.SpeechAnywhere.ca.js` |
| France | `https://speechanywhere.nuancehdp.com/delayed/scripts/Nuance.SpeechAnywhere.fr.js` |
| Germany | `https://speechanywhere.nuancehdp.com/delayed/scripts/Nuance.SpeechAnywhere.de.js` |
| UK | `https://speechanywhere.nuancehdp.com/delayed/scripts/Nuance.SpeechAnywhere.uk.js` |
| US | `https://speechanywhere.nuancehdp.com/delayed/scripts/Nuance.SpeechAnywhere.js` |

### Deferred correction

[Deferred correction](../concepts/deferred-correction.md) for Dragon Medical SpeechKit (Browser edition) is provided through specific URLs for each release channel. If you are integrating deferred correction functionality, use the deferred\-correction URL for your region.

| Dragon Medical Server location | Localized Dragon Medical SpeechKit (Browser edition) URL for deferred correction |
| --- | --- |
| Australia | `https://speechanywhere.nuancehdp.com/<release channel>/scripts/Nuance.SpeechAnywhere.playback.au.js` |
| Canada | not available |
| France | `https://speechanywhere.nuancehdp.com/<release channel>/scripts/Nuance.SpeechAnywhere.playback.fr.js` |
| Germany | `https://speechanywhere.nuancehdp.com/<release channel>/scripts/Nuance.SpeechAnywhere.playback.de.js` |
| UK | `https://speechanywhere.nuancehdp.com/<release channel>/scripts/Nuance.SpeechAnywhere.playback.uk.js` |
| US | `https://speechanywhere.nuancehdp.com/<release channel>/scripts/Nuance.SpeechAnywhere.playback.js` |

### Remarks

* Version\-specific paths (for example, /3\.3) were deprecated with the introduction of the release channel concept and are no longer available.
* For speech recognition, each localized Browser SDK instance connects to its respective localized Dragon Medical Server production environment.
* The release channels provide different versions of the Browser SDK scripts. All three release channels for a given region connect to the same Dragon Medical Server production environment for that region.
* The decision to use a specific channel for Browser SDK deployment, including skipping the use of beta channel and deploying directly to mainline, is at the discretion of Nuance. Nuance reserves the right to evaluate on a case\-by\-case basis whether a beta channel deployment is necessary.
* The beta version provided on the Beta channel is provided on an "as\-is" basis and Nuance does not guarantee its functionality. The beta version should not be used in production. Nuance will have no liability for damages arising out of or in connection with the use of the beta version.
* Nuance has no obligation to perform fixes to the beta version and may immediately and without notice change or remove the beta version or any part thereof for any reason. Nuance may change, fix bugs or vulnerabilities in, remove features from, add features to, or otherwise improve or modify the beta versions of SDKs before removing their beta designation.
