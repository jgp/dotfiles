#!/usr/bin/perl
# widget tree is as follows
#  Window
#       +-vbox
#           |
#           +-label
#           |
#           +-entry

use warnings;
use strict;
use Gtk2;

set_locale Gtk2;
init Gtk2;

# constants for easy changing of default settings
use constant TRUE  => 1;
use constant FALSE => 0;

# create the gui
my $window = Gtk2::Window->new;
$window->signal_connect(destroy => sub { Gtk2->main_quit; });
$window->set_decorated(FALSE);
#$window->set_policy(); if anyone could tell me the Gtk2 equivalent of this I'd be very grateful
$window->set_border_width(5);

# the main vbox
my $vbox = Gtk2::VBox->new(FALSE, 8);
$window->add($vbox);

# A label
my $label = Gtk2::Label->new('name:program');
$label->set_alignment(0, 0);
$vbox->add($label);

# Our entry box
my $entry = Gtk2::Entry->new();
$entry->signal_connect("activate", \&enter_pressed, $entry);
$vbox->add($entry);

# starting up, fingers crossed...
$window->show_all;
Gtk2->main;


# *** subroutines start here ***
sub close {
      Gtk2->main_quit;
      return TRUE;
}

sub enter_pressed {
            my ($widget, $entry) = @_;
            my $entry_text = $entry->get_text();

            if ($entry_text ne "") {
                        print "$entry_text";
                        exit();
            }
}
