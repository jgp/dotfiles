#!/bin/bash

MENUDIR=~/.config/openbox/pipe

cd

if ! [ -d pipe ] ; then
	mkdir pipe
fi

if ! [ -d pipe/etc ] ; then
	mkdir pipe/etc
fi

if ! [ -d pipe/doc ] ; then
	mkdir pipe/doc
fi

if ! [ -d pipe/lib ] ; then
	mkdir pipe/lib
fi

cp -f $MENUDIR/{gtk_bookmarks,kill,debug}.rb pipe/
cp -f $MENUDIR/lib/{menu,error}.rb pipe/lib
cp -f $MENUDIR/etc/{gtk_bookmarks,kill}.yml pipe/etc/

cat > pipe/doc/README << EOF
============================= POZNÁMKY ===============================

Veškeré skripty jsou pod GPL licencí.

Mnohé skripty jsou dosud v intenzivním vývoji (čtěte když mám čas a chuť, tak se jim tu a tam věnuju), je dosti pravděpodobné, že obsahují chyby, nepřesnosti, výjimky jsem zatím nestihl řešit vůbec, s dokumentací to také není valné. Berte to prostě jako fakt, ostatně je můžete zdokonalit (a v ideálním případě zaslat vylepšenou verzi na můj mail knava.bestvinensis@gmail.com). Jsou tam různé části kódu, které bych (a až se k tomu zase někdy dostanu, tak tak učiním) implementoval jinak, ostatně jsem se na nich před několika měsíci učil Ruby.


============================= SOUBORY =================================

===== etc =====
Tato složka klasicky obsahuje konfigurační soubory. Ty jsou ve formáty YAML. YAML je formát, který se snaží být dobře čitelný pro lidi a zároveň dobře použitelný v programátorské praxi. Lze do něj jednoduše zapisovat klasické datové typy jako jsou pole nebo hashe, takže se s ním pracuje velmi přirozeně.
V YAML formátu záleží na odsazení pomocí mezer (tabulátory neuznává). Pomlčka značí položku pole, key: value zase klíč a hodnotu hashe.
Pro více informací hledejte na wiki.

===== menu =====
 * gtk_bookmarks.rb
	Dělá menu se záložkami Natilu (Thunaru a dalších).
	V upravené formě bylo použito jako ukázka tvorby pipe-menu.

 * debug.rb
	Slouží jenom k debugování. Funguje jako příkaz "cat".
	Vytvoří menu ze souboru ~/.config/openbox/pipe/TMP.xml

 * kill.rb
	Zobrazuje nejvíce vytěžující procesy. Kliknutím na ně
	je jednoduše zabijete. Pokud není proces váš, máte možnost
	jej ukončit přes gksudo kill (nebo jiný podobný příkaz,
	který si zvolíte v etc/kill.yml).

===== lib =====
 * menu.rb
	Tiskne pipe-menu. Umožňuje jakkoliv složité menu (Řešeno rekurzí.)

 * error.rb
	Tiskne jednoduché chybové hlášky v podobě menu.


S přáním co největšího přínosu těchto skriptů, Botanicus.
EOF

ls -R pipe/ > pipe/doc/FILES
tar cvjpf pm.tbz pipe
