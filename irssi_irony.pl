use Irssi;
use Irssi::Irc;
use strict;
use warnings;
use vars qw($VERSION %IRSSI);
$VERSION="0.0.1";
%IRSSI = (
        authors => 'Pierre-Matthieu Alamy',
        contact => 'pm+irssi@alamy.fr',
        name    => 'irony',
        description     => 'Insert <irony> tags in setences',
        license => 'BSD 3-clause',
        url     => 'https://github.com/GrumpyCorp/irssi_irony',
);


# USAGE:
# /irony <text>

sub cmd_irony {
        my ($data, $server, $witem) = @_;
        if (!$server || !$server->{connected}) {
                Irssi::print("Not connected to server");
                return;
        }
        if ($data) {
                $witem->command("/SAY <irony>$data</irony>");
        }
}

sub cmd_coolstory {
        my ($data, $server, $witem) = @_;
        if (!$server || !$server->{connected}) {
                Irssi::print("Not connected to server");
                return;
        }
        if ($data) {
                $witem->command("/SAY <cool story bro>$data</cool story bro>");
        }
}

Irssi::command_bind('irony', 'cmd_irony');
Irssi::command_bind('coolstory', 'cmd_coolstory');
