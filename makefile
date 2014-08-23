% : %.pl makefile
	-rm -f $@
	perl -c $<
	cp $< $@
	chmod +x $@

all : debug

run debug: mkFiddle
	./mkFiddle > index.html

clean :
	-rm -f mkFiddle
