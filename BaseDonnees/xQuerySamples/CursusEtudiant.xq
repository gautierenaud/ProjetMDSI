let $file := doc("../BD/Etudiant.xml")
let $cursusList := distinct-values($file//Cursus)
return
  for $cursus in $cursusList
  return
    <cursus name="{$cursus}">{
     for $etud in $file//Etudiant
     where $etud/Cursus/text()=$cursus
     return
       $etud 
    }
    </cursus>