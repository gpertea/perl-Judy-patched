## Perl module providing bindings for Judy library

This is a patched version of the CPAN Judy module originally written by Joshua ben Jore
to provide basic access to Judy arrays (trees) library. The patch was written by
Jan Holčapek (https://github.com/holcapek) as a source RPM for Fedora, but I want to
make it available for manual install on other linux distributions.

The patch is trying to free this module from the *Alien::Judy*
module dependency which seems to be make the installation of the Judy module
unnecessarily complicated (and error prone) for people who already 
have the Judy library installed on their system.

### Installation

```
 tar xvfz Judy-0.41.tar.gz
 cd Judy-0.41
 chmod -R u+w *
 patch -p1 < ../avoid-using-alien-judy.patch
```
Now if on your system the Judy library was installed in a different, custom prefix path (i.e. not `/usr`), 
you have to edit a couple of lines in `Build.PL` at the end there to add the include path 
(where Judy.h resides) to *include_dirs* , and also modify *extra_linker_flags*
to add a `-L` linker option with the library path where `libJudy.so` resides, e.g.:
```
  include_dirs => [ '.' , '/data1/igm3/sw/include'],
  extra_linker_flags => '-L/data1/igm3/sw/lib -lJudy',
```
Then run:
```
  perl Build.PL
  ./Build
  ./Build install --prefix=/data1/igm3/sw/perl
```
For a quick test, run test1.pl (only tests Judy::1). (In my case `./Build test` fails with some cryptic message, seemingly due to missing another annoying dependency which does not seem to be necessary for the Judy modules)
