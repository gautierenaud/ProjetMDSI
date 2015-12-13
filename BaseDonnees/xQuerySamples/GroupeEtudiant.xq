let $file := doc("../BD/Etudiant.xml")
let $groupeList := distinct-values($file//Groupe)
return
  for $groupe in $groupeList
  return
    <groupe name="{$groupe}">{
     for $etud in $file//Etudiant
     where $etud/Groupe/text()=$groupe
     return
       $etud 
    }
    </groupe>