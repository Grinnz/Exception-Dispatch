package Exception::Dispatch;

use strict;
use warnings;

our $VERSION = '0.001';

1;

=head1 NAME

Exception::Dispatch - Typed dispatch for exception handling

=head1 SYNOPSIS

  use Syntax::Keyword::Try;
  use Exception::Dispatch;
  
  try {
    ...
  } catch {
    dispatch ($@) {
      case qr/Foo.*Bar/: {
        ...
      }
      case 'Some::Class':
      case 'Other::Class': {
        ...
      }
      default: {
        die $@;
      }
    }
  }

=head1 DESCRIPTION

This module provides typed dispatch for exception handling. Within a C<catch>
block, a C<dispatch> statement takes the value of the exception and contains
C<case> statements, which can take either a regex ref or class name string. If
a regex ref is provided, it will be considered a match if the exception is not
a reference and the text matches the regex. If a class name is provided, it
will be considered a match if the exception is a blessed reference which
L<< DOES|UNIVERSAL/"CLASS->DOES( ROLE )" >> the specified role/class. A
C<default> will match if no other cases have matched.

=head1 BUGS

Report any issues on the public bugtracker.

=head1 AUTHOR

Dan Book <dbook@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2017 by Dan Book.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=head1 SEE ALSO

