# Consent Mode for Microsoft UET tags

This Google Tag Manager tag template helps you to set and update consent signal for Microsoft Ads UET tags.

# How to use this template?

This tag has two consent comands: default and update, only for `ad_storage` signal. 

You can install this tag twice:

- A first tag for the default command, when the user did not give his consent yet ;
- A second tag for the update command, once you received the user choice. This tag can be used as a setup tag for all your UET tags.

# How to debug?

While the Consent tab in Google Tag Manager preview only works for Google tags, you have to use the Developper Tools Console for checking the consent status for your UET tags.

By typing `uetq` in the Developpers Tools Console, you can display the `uetq` object and checking for its `evq` property. In this property, you can found an array of consent status.

Also, if Consent Mode is correctly installed, your UET tags must be fired without consent, but, while there is no consent, none of these first-party cookies must be set: `_uetsid`, `_uetvid`, `_uetmsclkid`.


# Notes

[See Microsoft Ads official documentation about Consent Mode for UET tags](https://help.ads.microsoft.com/#apex/ads/en/60119/1)


