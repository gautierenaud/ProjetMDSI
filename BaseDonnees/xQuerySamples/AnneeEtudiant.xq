let $file := doc("../BD/Etudiant.xml")
let $anneeList := distinct-values($file//Annee)
return
  for $annee in $anneeList
  return
    <annee name="{$annee}">{
     for $etud in $file//Etudiant
     where $etud/Annee/text()=$annee
     return
       $etud 
    }
    </annee>