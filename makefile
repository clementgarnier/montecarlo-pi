#	Makefile created by MPDM
# 	Modifie ensuite manuellement par Guy Tremblay.

TT=100
N=2048

# Variables globales
MPD = mpd
MPDFLAGS = 
I = ./MPDinter
MPDLFLAGS = -w

.IGNORE:

# Tests pour verifier que le module Pi fonctionne correctement.

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
	./mesurer-temps 10000 5 $(TT) "1111"
	./mesurer-temps 30000 5 $(TT) "1111"
	./mesurer-temps 100000 5 $(TT) "1011"
	./mesurer-temps 200000 5 $(TT) "1011"
	./mesurer-temps 500000 5 $(TT) "1011"

mesures-vites: mesurer-temps
	./mesurer-temps 10000 4 $(TT) "1111"
	./mesurer-temps 30000 4 $(TT) "1111"
	./mesurer-temps 100000 4 $(TT) "1011"
	./mesurer-temps 200000 4 $(TT) "1011"
	./mesurer-temps 500000 4 $(TT) "1011"

mesures0: mesurer-temps
	./mesurer-temps 5000 4 $(TT) "1111"
	./mesurer-temps 15000 4 $(TT) "1111"
	./mesurer-temps 50000 4 $(TT) "1011"
	./mesurer-temps 100000 4 $(TT) "1011"
	./mesurer-temps 250000 4 $(TT) "1011"


tst00.out: $I/Geometrie.o $I/Barriere.o $I/MPDUnit.o $I/Pi.o $I/Tests00.o
	mpdl $(MPDLFLAGS)  -o tst00.out Geometrie MPDUnit Pi Tests00

tst0.out: $I/Geometrie.o $I/Barriere.o $I/MPDUnit.o $I/Pi.o $I/Tests0.o
	mpdl $(MPDLFLAGS)  -o tst0.out Geometrie MPDUnit Pi Tests0

tst1.out: $I/Geometrie.o $I/Barriere.o $I/MPDUnit.o $I/Pi.o $I/Tests1.o
	mpdl $(MPDLFLAGS)  -o tst1.out Geometrie MPDUnit Pi Tests1

tst2.out: $I/Geometrie.o $I/Barriere.o $I/MPDUnit.o $I/Pi.o $I/Tests2.o
	mpdl $(MPDLFLAGS)  -o tst2.out Geometrie MPDUnit Pi Tests2

tst3.out: $I/Geometrie.o $I/Barriere.o $I/MPDUnit.o $I/Pi.o $I/Tests3.o
	mpdl $(MPDLFLAGS)  -o tst3.out Geometrie MPDUnit Pi Tests3

# Programme pour comparer le temps d'execution des differents facon de multiplier.
mesurer-temps: $I/Geometrie.o $I/Barriere.o $I/MPDUnit.o $I/Pi.o $I/MesurerTemps.o
	mpdl $(MPDLFLAGS)  -o mesurer-temps Geometrie MPDUnit Pi MesurerTemps

invoquer: $I/Geometrie.o $I/MPDUnit.o $I/Pi.o $I/MesurerTemps.o $I/Invoquer.o
	mpdl $(MPDLFLAGS)  -o invoquer Geometrie MPDUnit Pi MesurerTemps Invoquer

$I/Pi.o: $I/Pi.spec $I/Geometrie.spec $I/Geometrie.o $I/Barriere.spec $I/Barriere.o\
 pi-body.mpd
	$(MPD) $(MPDFLAGS) -b pi-body.mpd

$I/Pi.spec: pi.mpd
	$(MPD) $(MPDFLAGS) -s pi.mpd

$I/Geometrie.o: $I/Geometrie.spec $I/MPDUnit.spec $I/MPDUnit.o\
 geometrie.mpd
	$(MPD) $(MPDFLAGS) -b geometrie.mpd

$I/Geometrie.spec: geometrie.mpd
	$(MPD) $(MPDFLAGS) -s geometrie.mpd

$I/Barriere.o: $I/Barriere.spec $I/MPDUnit.spec $I/MPDUnit.o\
 Barriere.mpd
	$(MPD) $(MPDFLAGS) -b Barriere.mpd

$I/Barriere.spec: Barriere.mpd
	$(MPD) $(MPDFLAGS) -s Barriere.mpd

$I/MPDUnit.o: $I/MPDUnit.spec MPDUnit-body.mpd
	$(MPD) $(MPDFLAGS) -b MPDUnit-body.mpd

$I/MPDUnit.spec: MPDUnit.mpd
	$(MPD) $(MPDFLAGS) -s MPDUnit.mpd

$I/MesurerTemps.o: $I/MesurerTemps.spec $I/Pi.spec\
 $I/Pi.o $I/MPDUnit.spec $I/MPDUnit.o $I/Geometrie.spec\
 $I/Geometrie.o $I/Barriere.spec $I/Barriere.o \
 mesurer-temps.mpd
	$(MPD) $(MPDFLAGS) -b mesurer-temps.mpd

$I/MesurerTemps.spec: mesurer-temps.mpd
	$(MPD) $(MPDFLAGS) -s mesurer-temps.mpd

$I/Invoquer.o: $I/Invoquer.spec $I/Pi.spec\
 $I/Pi.o $I/Geometrie.spec\
 $I/Geometrie.o $I/MesurerTemps.spec $I/MesurerTemps.o \
 invoquer.mpd
	$(MPD) $(MPDFLAGS) -b invoquer.mpd

$I/Invoquer.spec: invoquer.mpd
	$(MPD) $(MPDFLAGS) -s invoquer.mpd

$I/Tests00.o: $I/Tests00.spec $I/Pi.spec\
 $I/Pi.o $I/MPDUnit.spec $I/MPDUnit.o $I/Geometrie.spec\
 $I/Geometrie.o $I/Barriere.spec $I/Barriere.o tst00.mpd
	$(MPD) $(MPDFLAGS) -b tst00.mpd

$I/Tests00.spec: tst00.mpd
	$(MPD) $(MPDFLAGS) -s tst00.mpd

$I/Tests0.o: $I/Tests0.spec $I/Pi.spec\
 $I/Pi.o $I/MPDUnit.spec $I/MPDUnit.o $I/Geometrie.spec\
 $I/Geometrie.o $I/Barriere.spec $I/Barriere.o tst0.mpd
	$(MPD) $(MPDFLAGS) -b tst0.mpd

$I/Tests0.spec: tst0.mpd
	$(MPD) $(MPDFLAGS) -s tst0.mpd

$I/Tests1.o: $I/Tests1.spec $I/Pi.spec\
 $I/Pi.o $I/MPDUnit.spec $I/MPDUnit.o $I/Geometrie.spec\
 $I/Geometrie.o $I/Barriere.spec $I/Barriere.o tst1.mpd
	$(MPD) $(MPDFLAGS) -b tst1.mpd

$I/Tests1.spec: tst1.mpd
	$(MPD) $(MPDFLAGS) -s tst1.mpd

$I/Tests2.o: $I/Tests2.spec $I/Pi.spec\
 $I/Pi.o $I/MPDUnit.spec $I/MPDUnit.o $I/Geometrie.spec\
 $I/Geometrie.o $I/Barriere.spec $I/Barriere.o tst2.mpd
	$(MPD) $(MPDFLAGS) -b tst2.mpd

$I/Tests2.spec: tst2.mpd
	$(MPD) $(MPDFLAGS) -s tst2.mpd

$I/Tests3.o: $I/Tests3.spec $I/Pi.spec\
 $I/Pi.o $I/MPDUnit.spec $I/MPDUnit.o $I/Geometrie.spec\
 $I/Geometrie.o $I/Barriere.spec $I/Barriere.o tst3.mpd
	$(MPD) $(MPDFLAGS) -b tst3.mpd

$I/Tests3.spec: tst3.mpd
	$(MPD) $(MPDFLAGS) -s tst3.mpd

clean:
	rm -rf $I 
	rm -f core a.out tst00.out tst0.out tst1.out tst2.out tst3.out mesurer-temps invoquer
	\rm -f *~

cleanxtra:
	rm -rf Pi
	rm -f *.squel*




