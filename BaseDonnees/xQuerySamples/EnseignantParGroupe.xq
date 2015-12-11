xquery version "1.0";

let $enseignants := doc("../BD/Enseignant.xml")
let $etudiants := doc("../BD/Etudiant.xml")
let $matieres := doc("../BD/Matiere.xml")

let $anneeList := distinct-values($etudiants//Annee)

for $annee in $anneeList,
    $etudiant in $etudiants,
    $enseignant in $enseignants,
    $matiere in $matieres
return
<ans>
  {$etudiant/Personne}
</ans>
  