This is a patched version of the perl Judy module written by Joshua ben Jore
to provide basic access to Judy arrays (trees).

The patch is trying to free this module from the Alien::Judy
dependency which seems to make the installation of the Judy module
unnecessarily complicated (and error prone) especially for people 
who already have the Judy library already installed on their system.

Installation:
=============

 tar xvfz Judy-0.41.tar.gz
 cd Judy-0.41
 chmod -R u+w *
 patch -p1 < ../avoid-using-alien-judy.patch

Now edit the Build.PL file at the end there to add the include path 
(where Judy.h resides) to include_dirs , and also modify extra_linker_flags 
to add a -L linker option with the library path where libJudy.so resides, e.g.:

  include_dirs => [ '.' , '/data1/igm3/sw/include'],
  extra_linker_flags => '-L/data1/igm3/sw/lib -lJudy',

Then run:
  perl Build.PL
  ./Build
  ./Build install --prefix=/data1/igm3/sw/perl

For a quick test, run test1.pl (only tests Judy::1).
