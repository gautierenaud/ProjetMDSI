xquery version "1.0";

let $etudiants := doc("../BD/Etudiant.xml")
let $matieres := doc("../BD/Matiere.xml")

return 
    for $etudiant in $etudiants//Etudiant
    where $etudiant/Matieres/MatieresParAnnee/Note <10 
    
    return
    <ans>{$etudiant/Personne/Nom}</ans>