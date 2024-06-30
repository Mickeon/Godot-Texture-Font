> [!WARNING]
> This port from 3.x is still _"Work in Progress"_.
> Some things may not work properly, a few things may break over time.

# <img width=5% src=icon.png> TextureFont for Godot 4.2+ 

**TextureFont** is an addon for Godot that allows creating fonts from textures from directly within the editor.<br>
This addon adds a new **TextureFont** resource that defines how each character is mapped to the texture(s). These resources can be used anywhere a font is expected (Such as **Label**, **Button**, **TextEdit**, etc.). They allow for fancier, more colorful, or more retro-looking fonts over the standard formats.

<img src=media/preview_mapping.png width=75%>
<img src=media/preview_settings.png width=75%>

Although not up-to-date, the [original guide](https://github.com/ElectronicBlueberry/Texture-Fonts/wiki) should suffice as a point of reference. However, it shouldn't be too hard to figure out.
What you do need to know for starters:
- Enable this addon in the Project Setting's "_Plugins_" tab;
- Navigate to the File System dock, right click and select _"New Resource..."_;
- Look up and pick _"TextureFont"_. Once it has been created, select it;
- Congratulations! The Texture Font editor is now open. O joy of creation.

-----------

Credit to @ElectronicBlueberry for the original addon.<br>
This port was initially tailored specifically to my project. However, I feel like the public would benefit from it as well.

Notable differences currently include:
- Image `scale` and `interpolation` are disabled.
	- A better, more dynamic solution may be added in the future.

> [!NOTE]
> This port uses a very hacky solution to use a placeholder texture temporarily whenever a **TextureFont** is saved in the editor, to avoid massive data bloat. This causes Git to report false changes and may also cause a few errors on save.
> This is not avoidable in 4.2, but should be addressed from 4.3 forward (see https://github.com/godotengine/godot/issues/82254).
