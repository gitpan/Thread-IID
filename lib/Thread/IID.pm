use strict;
use warnings;

package Thread::IID;
BEGIN {
  $Thread::IID::VERSION = '0.010002_002';
}

 use 5.008001;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Thread::IID ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
  get_interpreter_id	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = ();

our $VERSION;

require XSLoader;
XSLoader::load('Thread::IID', $VERSION);

# Preloaded methods go here.

1;
__END__

=head1 NAME

Thread::IID - unique perl Interpreter IDs

=head1 VERSION

version 0.010002_002

=head1 SYNOPSIS

  use Thread::IID ':all';

  print "Hi, I am interpreter #" . get_interpreter_id();

=head1 DESCRIPTION

This provides an identifier to distinguish Perl interpreter instances.

In environments like L<mod_perl|mod_perl>, where interpreters are 
cloned and passed around between OS threads, the thread ID gives no 
indication of which interpreter instance is actually running
(and hence which corresponding set of values/data-structures 
is actually being referenced)

=head2 EXPORT

None by default.  The following function is available:

=head3 get_interpreter_id()

Returns an integer ID for the current Perl interpreter instance.  

Where multiple interpreters have been created to run in 
threads of the current process the IDs returned will be 
different for each interpreter, regardless of which
threads are running which interpreters.

=head1 AUTHOR

Original XS code is from a posting by ikegami at PerlMonks.
Packaged by Roger Crew, E<lt>crew@cs.stanford.eduE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Roger Crew

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut