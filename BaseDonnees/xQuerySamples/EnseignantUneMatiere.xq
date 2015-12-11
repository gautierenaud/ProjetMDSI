xquery version "1.0";

let $enseignants := doc("../BD/Enseignant.xml")
let $matieres := doc("../BD/Matiere.xml")

return
  for $matiere in $matieres//Matiere,
      $enseignant in $enseignants//Enseignant,
      $matParEnseignant in $enseignant/MatID 
  where $matiere/@ID = $matParEnseignant/@MatiereID 
  return
  <ans>
    {$matiere/Nom}
    {$enseignant/Personne}
   
    </ans>