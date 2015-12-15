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