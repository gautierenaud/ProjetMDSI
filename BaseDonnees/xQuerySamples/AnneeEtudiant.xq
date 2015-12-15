let $etudiants := doc("../BD/Etudiant.xml")
let $anneeList := distinct-values($etudiants//AnneeActuelle)
return
<ans>
{
  for $annee in $anneeList
  
  return
    <annee name="{$annee}">
    {
     for $etud in $etudiants//Etudiant
     where $etud/AnneeActuelle/text()=$annee
     return
     <Etudiant>
       {$etud/Personne}
     </Etudiant>
    }
    </annee>
}
</ans>