#	Makefile created by MPDM
# 	Modifie ensuite manuellement par Guy Tremblay.

TT=8
N=2048

# Variables globales
MPD = mpd
MPDFLAGS = 
I = ./MPDinter
MPDLFLAGS = -w

.IGNORE:

# Tests pour verifier que le module fonctionne correctement.

TESTS_EXEC = tst00.out tst0.out tst1.out tst2.out tst3.out

compile: $(TESTS_EXEC)

tsts tests: $(TESTS_EXEC)
	./tst0.out
	./tst1.out
	./tst2.out
	./tst3.out

tst00: tst00.out
	./tst00.out

tst0: tst0.out
	./tst0.out

tst1: tst1.out
	./tst1.out

tst2: tst2.out
	./tst2.out

tst3: tst3.out
	./tst3.out

mesures: mesurer-temps
	./mesurer-temps 256 5 $(TT) "11111"
	./mesurer-temps 512 5 $(TT) "11111"
	./mesurer-temps 1024 5 $(TT) "11111"
	./mesurer-temps 2048 5 $(TT) "11111"
	./mesurer-temps 4096 5 $(TT) "11111"

mesures-vites: mesurer-temps
	./mesurer-temps 128 4 $(TT) "11111"
	./mesurer-temps 256 4 $(TT) "10111"
	./mesurer-temps 512 4 $(TT) "10111"
	./mesurer-temps 1024 4 $(TT) "10111"
	./mesurer-temps 2048 4 $(TT) "10111"
	./mesurer-temps 4096 4 $(TT) "10111"

mesures0: mesurer-temps
	./mesurer-temps 64 4 $(TT) "11111"
	./mesurer-temps 128 4 $(TT) "11111"
	./mesurer-temps 256 4 $(TT) "11111"
	./mesurer-temps 512 4 $(TT) "11111"
	./mesurer-temps 1024 4 $(TT) "11111"


tst00.out: $I/MPDUnit.o $I/Geometrie.o $I/Tests00.o
	mpdl $(MPDLFLAGS)  -o tst00.out MPDUnit Geometrie Tests00

tst0.out: $I/MPDUnit.o $I/Geometrie.o $I/Tests0.o
	mpdl $(MPDLFLAGS)  -o tst0.out MPDUnit Geometrie Tests0

tst1.out: $I/MPDUnit.o $I/Geometrie.o $I/Tests1.o
	mpdl $(MPDLFLAGS)  -o tst1.out MPDUnit Geometrie Tests1

tst2.out: $I/MPDUnit.o $I/Geometrie.o $I/Tests2.o
	mpdl $(MPDLFLAGS)  -o tst2.out MPDUnit Geometrie Tests2

tst3.out: $I/MPDUnit.o $I/Geometrie.o $I/Tests3.o
	mpdl $(MPDLFLAGS)  -o tst3.out MPDUnit Geometrie Tests3

# Programme pour comparer le temps d'execution des differents facon de multiplier.
mesurer-temps: $I/MPDUnit.o $I/Geometrie.o $I/MesurerTemps.o
	mpdl $(MPDLFLAGS)  -o mesurer-temps MPDUnit Geometrie MesurerTemps

$I/Geometrie.o: $I/Geometrie.spec\
 geometrie-body.mpd
	$(MPD) $(MPDFLAGS) -b geometrie-body.mpd

$I/Geometrie.spec: geometrie.mpd
	$(MPD) $(MPDFLAGS) -s geometrie.mpd

$I/MPDUnit.o: $I/MPDUnit.spec MPDUnit-body.mpd
	$(MPD) $(MPDFLAGS) -b MPDUnit-body.mpd

$I/MPDUnit.spec: MPDUnit.mpd
	$(MPD) $(MPDFLAGS) -s MPDUnit.mpd

$I/MesurerTemps.o: $I/MesurerTemps.spec $I/Geometrie.spec\
 $I/Geometrie.o $I/MPDUnit.spec $I/MPDUnit.o\
 mesurer-temps.mpd
	$(MPD) $(MPDFLAGS) -b mesurer-temps.mpd

$I/MesurerTemps.spec: mesurer-temps.mpd
	$(MPD) $(MPDFLAGS) -s mesurer-temps.mpd

$I/Tests00.o: $I/Tests00.spec $I/Geometrie.spec\
 $I/Geometrie.o $I/MPDUnit.spec $I/MPDUnit.o\
 tst00.mpd
	$(MPD) $(MPDFLAGS) -b tst00.mpd

$I/Tests00.spec: tst00.mpd
	$(MPD) $(MPDFLAGS) -s tst00.mpd

$I/Tests0.o: $I/Tests0.spec $I/Geometrie.spec\
 $I/Geometrie.o $I/MPDUnit.spec $I/MPDUnit.o\
 tst0.mpd
	$(MPD) $(MPDFLAGS) -b tst0.mpd

$I/Tests0.spec: tst0.mpd
	$(MPD) $(MPDFLAGS) -s tst0.mpd

$I/Tests1.o: $I/Tests1.spec $I/Geometrie.spec\
 $I/Geometrie.o $I/MPDUnit.spec $I/MPDUnit.o\
 tst1.mpd
	$(MPD) $(MPDFLAGS) -b tst1.mpd

$I/Tests1.spec: tst1.mpd
	$(MPD) $(MPDFLAGS) -s tst1.mpd

$I/Tests2.o: $I/Tests2.spec $I/Geometrie.spec\
 $I/Geometrie.o $I/MPDUnit.spec $I/MPDUnit.o\
 tst2.mpd
	$(MPD) $(MPDFLAGS) -b tst2.mpd

$I/Tests2.spec: tst2.mpd
	$(MPD) $(MPDFLAGS) -s tst2.mpd

$I/Tests3.o: $I/Tests3.spec $I/Geometrie.spec\
 $I/Geometrie.o $I/MPDUnit.spec $I/MPDUnit.o\
 tst3.mpd
	$(MPD) $(MPDFLAGS) -b tst3.mpd

$I/Tests3.spec: tst3.mpd
	$(MPD) $(MPDFLAGS) -s tst3.mpd

clean:
	rm -rf $I 
	rm -f core a.out tst00.out tst0.out tst1.out tst2.out tst3.out mesurer-temps
	\rm -f *~

cleanxtra:
	rm -rf Geometrie
	rm -f *.squel*




