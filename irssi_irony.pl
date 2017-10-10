use Irssi;
use Irssi::Irc;
use strict;
use warnings;
use vars qw($VERSION %IRSSI);
$VERSION="0.0.1";
%IRSSI = (
	authors	=> 'Pierre-Matthieu Alamy',
	contact	=> 'pm+irssi@alamy.fr',
	name	=> 'irony',
	description	=> 'Insert <irony> tags in setences',
	license	=> 'BSD 3-clause',
	url	=> 'https://github.com/GrumpyCorp/irssi_irony',
);


sub cmd_tag {
	my ($tagname) = @_;
	return sub {
		my ($data, $server, $witem) = @_;
		if (!$server || !$server->{connected}) {
			Irssi::print("Not connected to server");
			return;
		}
		if ($data) {
			$witem->command("/SAY <$tagname>$data</$tagname>");
		}
	}
}

# USAGE:
# /irony <text>

sub cmd_irony { cmd_tag("irony")->(@_); }
Irssi::command_bind('irony', 'cmd_irony');

# USAGE:
# /coolstory <text>

sub cmd_coolstory { cmd_tag("cool story bro")->(@_); }
Irssi::command_bind('coolstory', 'cmd_coolstory');

# USAGE:
# /seriously <text>

sub cmd_seriously { cmd_tag("seriously")->(@_); }
Irssi::command_bind('seriously', 'cmd_seriously');
