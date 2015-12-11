xquery version "1.0";

let $etudiants := doc("../BD/Etudiant.xml")
let $matieres := doc("../BD/Matiere.xml")
return
<ans>
{
  for $etud in $etudiants/Etudiants/Etudiant
  return
    <Etudiant>
       {$etud/Personne/Nom}
       {$etud/Personne/Prenom}
       {
         for $annee in $etud/Matieres/MatieresParAnnee
         return
           <Annee value="{$annee/@Annee}">
             {
                for $matiereEtud in $annee/MatID,
                    $matiere in $matieres/Matieres/Matiere
                where $matiere/@ID=$matiereEtud/@MatiereID
                return
                  <Matiere name="{$matiere/Nom}">
                  {
                     for $note in $matiereEtud/Note
                     return
                       $note
                  }
                  </Matiere>
             }
           </Annee>
       }
    </Etudiant>
}
</ans>  