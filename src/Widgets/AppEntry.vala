/*
 * SPDX-FileCopyrightText: 2011-2026 elementary, Inc. (https://elementary.io)
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

public class Widgets.AppEntry : Gtk.ListBoxRow {
    private const string BUBBLES_KEY = "bubbles";
    private const string SOUNDS_KEY = "sounds";
    private const string REMEMBER_KEY = "remember";

    public Backend.App app { get; construct; }

    public AppEntry (Backend.App app) {
        Object (app: app);
    }

    construct {
        var image = new Gtk.Image.from_gicon (app.app_info.get_icon ()) {
            icon_size = LARGE
        };

        var header_label = new Granite.HeaderLabel (app.app_info.get_display_name ()) {
            ellipsize = END,
            secondary_text = get_permissions_string (app),
            size = H3
        };

        var box = new Granite.Box (HORIZONTAL, HALF);
        box.append (image);
        box.append (header_label);

        child = box;

        app.settings.changed.connect (() => {
            header_label.secondary_text = get_permissions_string (app);
        });
    }

    private string get_permissions_string (Backend.App app) {
        string[] items = {};

        if (app.settings.get_boolean (BUBBLES_KEY)) {
            items += _("Bubbles");
        }

        if (app.settings.get_boolean (SOUNDS_KEY)) {
            items += _("Sounds");
        }

        if (app.settings.get_boolean (REMEMBER_KEY)) {
            items += _("Notification Center");
        }

        if (items.length == 0) {
            items += _("Disabled");
        }

        return string.joinv (", ", items);
    }
}
