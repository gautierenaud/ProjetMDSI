xquery version "1.0";

let $enseignants := doc("../BD/Enseignant.xml")
let $etudiants := doc("../BD/Etudiant.xml")
let $matieres := doc("../BD/Matiere.xml")

return
  for $enseignant in $enseignants
  return
    $enseignant