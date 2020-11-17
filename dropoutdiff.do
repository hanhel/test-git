* Ny modell (f.o.m. 2019-profilene); kjøring av skript fra knapp (og dialogboks)
  *i Access. Bruker av dialogboksen definerer de globale makroene på de følgende 
  *linjene.
local geonivaa "$geonivaa" 		// Kommune / Bydel / Fylke 
local innevProfilaar $aargang 	// Året profilen skal publiseres
local profiltype "$profiltype"  // FHP / OPPV / ...


* KJØRING:
set more off
version 12
pause on



*** 2-a. MAKROER og temporære filer *******************************************
local antF $antallFylker // brukes til automatisk kvalitetskontroll
*local antK $antallKommuner // brukes til automatisk kvalitetskontroll
*local antB $antallBydeler // ---"-- f.eks. per 2018; Oslo:15+Bg:8+Tr.h.:4+Stv.:7
global trunclower=50 // nedre grense for barometerverdier
global truncupper=200 // øvre grense for barometerverdier
*local n_beste=10 // bestemmer om vi får top 10, top 5 eller top 3 i den tynne 
	// søylen i barometeret. 
	// OBS: Dersom tallet endres må en makro i barometer-skriptet også endres: 
	// 3-FHP_BAROMETER.do  (se -local upperTen ...-, ca linje 50)   som              
	// ligger i: "F:\Prosjekter\Kommunehelsa\PRODUKSJON\BIN\Z_Profiler"


*Avledede macroer
local antLFK = 1+`antF' // antall = #landet+#fylker
*local antLFKB = `antLFK'+`antB'  // antall = antLFK+ #bydeler(unnt. Marka, Sentrum)
local Filliste_LFKB ""
local Filliste_LFK_ikkeB ""
local Filliste_feil ""
* Geo-koder. 
tempfile mastergeo
use "F:\Prosjekter\Kommunehelsa\Masterfiler\\`innevProfilaar'\Stedsnavn_SSB_Unicode.dta",  clear
sort geo
save "`mastergeo'"
*******************************************************************************





csi a b c d

