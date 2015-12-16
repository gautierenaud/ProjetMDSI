xquery version "3.0";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:omit-xml-declaration "no";

processing-instruction xml-stylesheet {'type="text/xsl"','href="liste_matieres_pour_1_enseignant.xsl"'},

let $file := doc("../BD/Etudiant.xml")
let $cursus := doc("../BD/ListCursus.xml")
let $cursusList := distinct-values($cursus//Cursus/@CursusName)
return
<ans>
{
  for $cursus in $cursusList
  return
    <cursus name="{$cursus}">{
     for $etud in $file//Etudiant
     where $etud/Cursus/@CursusName=$cursus
     return
       <Etudiant>
         <Nom>{$etud/Personne/Nom/text()}</Nom>
         <Prenom>{$etud/Personne/Prenom/text()}</Prenom>
       </Etudiant>
     }
     </cursus>
}
</ans>