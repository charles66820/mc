SOURCE = $(wildcard *.lua)

all:
	scp -r $(SOURCE) charles@magicorp.fr:/srv/git/magitransfile/files/mc/

clean:
	rm toto.txt