/*
 * Copyright (c) 2011-2015 elementary Developers
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street - Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

public class Widgets.Footer : Gtk.ActionBar {
    private Gtk.Label do_not_disturb_label;
    private Gtk.Switch do_not_disturb_switch;

    construct {
        build_ui ();
        create_bindings ();
    }

    private void build_ui () {
        this.get_style_context ().add_class (Gtk.STYLE_CLASS_INLINE_TOOLBAR);

        do_not_disturb_label = new Gtk.Label (_("Do Not Disturb"));
        do_not_disturb_label.get_style_context ().add_class ("h4");
        do_not_disturb_label.margin_start = 6;

        do_not_disturb_switch = new Gtk.Switch ();
        do_not_disturb_switch.margin = 12;
        do_not_disturb_switch.margin_end = 6;

        this.pack_start (do_not_disturb_label);
        this.pack_end (do_not_disturb_switch);
    }

    private void create_bindings () {
        Backend.NotifyManager.get_default ().bind_property ("do-not-disturb",
                                                            do_not_disturb_switch,
                                                            "state",
                                                            BindingFlags.BIDIRECTIONAL | BindingFlags.SYNC_CREATE);
    }
}
