# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess
from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from theme import colors, QTILE_PATH


mod = "mod4"
terminal = guess_terminal()

keys = [
    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down(),
        desc="Move focus down in stack pane"),
    Key([mod], "j", lazy.layout.up(),
        desc="Move focus up in stack pane"),

    # Move windows up or down in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),
    Key([mod, "control"], "j", lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate(),
        desc="Swap panes of split stack"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

    # Volume
    #([], "XF86AudioLowerVolume", lazy.spawn(
        #"pactl set-sink-volume @DEFAULT_SINK@ -5%"
    #)),
    #([], "XF86AudioRaiseVolume", lazy.spawn(
        #"pactl set-sink-volume @DEFAULT_SINK@ +5%"
    #)),
    #([], "XF86AudioMute", lazy.spawn(
        #"pactl set-sink-mute @DEFAULT_SINK@ toggle"
    #)),

    # Brightness
    #([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    #([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]

groups = [Group(i) for i in "asdfuiop"]

for i, group in enumerate(groups, 1):
    group_key = str(i)
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], group_key, lazy.group[group.name].toscreen(),
            desc="Switch to group {}".format(group.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], group.name, lazy.window.togroup(group.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(group.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])


layout_conf = {
    'border_focus': colors['focus'][0],
    'border_width': 1,
    'margin': 4
}

layouts = [
    layout.Max(**layout_conf),
    layout.Stack(num_stacks=2, **layout_conf),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    layout.Matrix(**layout_conf),
    layout.MonadTall(**layout_conf),
    layout.MonadWide(**layout_conf),
    layout.RatioTile(),
    layout.Tile(**layout_conf),
    layout.TreeTab(**layout_conf),
    layout.VerticalTile(),
    layout.Zoomy(**layout_conf),
]

floating_layout = layout.Floating(
    float_rules = [
        {'wmclass': 'confirm'},
        {'wmclass': 'dialog'},
        {'wmclass': 'download'},
        {'wmclass': 'error'},
        {'wmclass': 'file_progress'},
        {'wmclass': 'notification'},
        {'wmclass': 'splash'},
        {'wmclass': 'toolbar'},
        {'wmclass': 'confirmreset'},
        {'wmclass': 'makebranch'},
        {'wmclass': 'maketag'},
        {'wname': 'branchdialog'},
        {'wname': 'pinentry'},
        {'wmclass': 'ssh-askpass'},
    ],
    border_focus = colors['color4'][0]
)

# WIDGET
base = lambda fg='text', bg='dark': {
    'foreground': colors[fg],
    'background': colors[bg]
}

separator = lambda: widget.Sep(**base(), linewidth=0, padding=5)

icon = lambda fg='text', bg='dark', fontsize=16, text="?": widget.TextBox(
    **base(fg, bg),
    fontsize=fontsize,
    text=text,
    padding=2
)

powerline = lambda fg="light", bg="dark": widget.TextBox(
   **base(fg, bg),
    text="", # Icon: nf-oct-triangle_left
    fontsize=47,
    padding=-3
)

workspaces = lambda: [
    separator(),
    widget.GroupBox(
        **base(fg='light'),
        font='UbuntuMono Nerd Font',
        fontsize=19,
        margin_y=3,
        margin_x=0,
        padding_y=8,
        padding_x=5,
        borderwidth=1,
        active=colors['active'],
        inactive=colors['inactive'],
        rounded=False,
        highlight_method='block',
        urgent_alert_method='block',
        urgent_border=colors['urgent'],
        this_current_screen_border=colors['focus'],
        this_screen_border=colors['grey'],
        other_current_screen_border=colors['dark'],
        other_screen_border=colors['dark'],
        disable_drag=True
    ),
    separator(),
    widget.WindowName(**base(fg='focus'), fontsize=14, padding=5),
    separator(),
]

primary_widgets = [
    *workspaces(),
    separator(),

    powerline('color4', 'dark'),
    icon(bg="color4", text=' '), # Icon: nf-fa-download
    widget.CheckUpdates(**base(bg='color4'), update_interval=1800),

    powerline('color2', 'color4'),
    widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),
    widget.CurrentLayout(**base(bg='color2'), padding=5),

    powerline('color3', 'color2'),
    icon(bg="color3", text=' '),  # Icon: nf-fa-feed
    widget.Net(**base(bg='color3'), interface='enp5s0'),

    powerline('color1', 'color3'),
    widget.Clock(**base(bg='color1'), format='%I:%M %p'),

    powerline('dark', 'color1'),
    widget.Systray(background=colors['dark'], padding=5),
    widget.Volume(background=colors['dark'], update_interval=0.2, emoji=True),
    widget.BatteryIcon(background=colors['dark']),
    widget.ThermalSensor(background=colors['dark']),
]

secondary_widgets = [
    *workspaces(),
    separator(),

    powerline('color1', 'dark'),
    widget.CurrentLayoutIcon(**base(bg='color1'), scale=0.65),
    widget.CurrentLayout(**base(bg='color1'), padding=5),
]

widget_defaults = dict(
    font='UbuntuMono Nerd Font',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            primary_widgets,
            #[
                #widget.CurrentLayout(),
                #widget.GroupBox(),
                #widget.Prompt(),
                #widget.WindowName(),
                #widget.Chord(
                    #chords_colors={
                        #'launch': ("#ff0000", "#ffffff"),
                    #},
                    #name_transform=lambda name: name.upper(),
                #),
                #widget.TextBox("default config", name="default"),
                #widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                #widget.Systray(),
                #widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
                #widget.QuickExit(),
            #],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

@hook.subscribe.startup_once
def autostart():
    subprocess.call([os.path.join(QTILE_PATH, 'autostart.sh')])

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
