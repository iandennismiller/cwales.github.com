(* 
	Correct answer to problem 4.18
*)

#use "topfind";;
#require "netclient";;

let private_press = "H12230"
let ppppprint_the q doc =
	Sys.command("wget -q -O _tmp " ^ q ^ "/" ^ doc);
	Sys.command("lp -o raw -d " ^ private_press ^ " _tmp")

let sscan_the thisfar q line =
	let entry = Str.split(Str.regexp "\t") line in
	let nyman = List.hd entry in
	if not (Hashtbl.mem thisfar nyman) then
		let exitid = ppppprint_the q nyman in
			Printf.printf "NEW %s\n" nyman;
			Hashtbl.add thisfar nyman (List.nth entry 1)

let hhit_the q =
	Http_client.Convenience.http_get(q ^ "/index.html")

let wwhat_the q =
	let thisfar = Hashtbl.create 32 in
	while true do
		let index = hhit_the q in
		let lines = Str.split(Str.regexp "\n") index in
			List.iter (fun s -> 
				if Str.string_match(Str.regexp "^SPOOL") s 0
				then sscan_the thisfar q s) lines; Unix.sleep 300
	done

let _ = match Sys.argv with [| _; q |] -> wwhat_the q
	| _ -> failwith "come on give me a push here."

(* 
	2013-04-16 Ian Dennis Miller
	Transcribed from _why's handwritten-then-scanned printout 'HOMEWORK'
	
	This is an OCaml script that polls a site (e.g. whytheluckystiff.net)
	When it finds something it likes, it'll print it directly with lp

	So-called "problem 4.18" is probably a reference to April 18.
	Maybe there will be something to print then?

	Getting started on OS X; the following is approximate

	brew install ocaml
	wget http://download.camlcity.org/download/findlib-1.3.3.tar.gz
	wget http://download.camlcity.org/download/ocamlnet-3.6.3.tar.gz

	for tgz in (findlib ocamlnet); do \
		tar xvfz ${tgz}*.tar.gz && cd $tgz && ./configure && make all \
			&& sudo -u admin make install && cd ..; \
	done
*)
