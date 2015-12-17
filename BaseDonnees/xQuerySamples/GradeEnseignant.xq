let $enseignants := doc("../BD/Enseignant.xml")
let $gradeList := distinct-values($enseignants//Grade/text())
return 
<ans>
{
for $grade in $gradeList
return 
  <grade name="{$grade}">{
    for  $ens in $enseignants//Enseignant
     where $ens/Grade/text() = $grade
     return 
       <Enseignant >{
        $ens/Personne 
       }
       </Enseignant>
  }
  </grade>
    
 }
 </ans>