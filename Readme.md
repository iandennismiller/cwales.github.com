2013-04-16 
Ian Dennis Miller

# just_let_this_sit.ml

Transcribed from _why's handwritten-then-scanned printout 'HOMEWORK'. Here is a copy of the original: http://www.scribd.com/doc/135658986/-why-Homework


This is an OCaml script that polls a site (e.g. whytheluckystiff.net)
When it finds something it likes, it'll print it directly with lp

## usage

    ocaml just_let_this_sit.ml http://whytheluckystiff.net

## Getting started on OS X

    brew install ocaml
    wget http://download.camlcity.org/download/findlib-1.3.3.tar.gz
    wget http://download.camlcity.org/download/ocamlnet-3.6.3.tar.gz

## This is approximate

    for tgz in (findlib ocamlnet); do \
        tar xvfz ${tgz}*.tar.gz && cd $tgz && ./configure && make all \
            && sudo -u admin make install && cd ..; \
    done

## Notes

So-called "problem 4.18" is probably a reference to April 18. Maybe there will be something to print then?

set your own printer name in *just_let_this_sit.ml* because the default H12230 probably won't work.

if you're not going to be printing the stuff to a real printer, consider the following:

    Sys.command("wget -q -O ./" ^ doc ^ ".pcl " ^ q ^ "/" ^ doc)


## Disclaimer

I don't really know OCaml, so this may be buggy.
