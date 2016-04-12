use strict;
use warnings;
package WWW::canihazip;

use HTTP::Tiny;
use 5.008;

# ABSTRACT: Returns your ip address using L<http://canihazip.com>

=head1 SYNOPSIS

    use WWW::canihazip;
    my $ip = get_ip();

=head1 EXPORTS

Exports the C<get_ip> function.

=cut

BEGIN {
    require Exporter;
    use base 'Exporter';
    our @EXPORT = 'get_ip';
    our @EXPORT_OK = ();
}

=head1 FUNCTIONS

=head2 get_ip

Returns your external ipv4 address.

=cut

sub get_ip {
  my $response = HTTP::Tiny->new->get("http://canihazip.com/s");
  die sprintf 'Error fetching ip: %s %s',
    ($response->{status} || ''),
    ($response->{reason} || '') unless $response->{success};
  $response->{content};
}

=head1 SEE ALSO

L<WWW::ipinfo> - a similar module that returns your ip address and more

L<WWW::hmaip> - a similar module that returns your ip address

L<WWW::IP> - a wrapper module that uses up to 3 services to retrieve your IP address

=cut

1;
