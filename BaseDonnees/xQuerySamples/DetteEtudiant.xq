let $etudiants := doc("../BD/Etudiant.xml")
let $matieres  := doc("../BD/Matiere.xml")

return
<ans>
{
  for $etud in $etudiants//Etudiant
  return
    <Etudiant>
      <Nom>{$etud/Personne/Nom/text()}</Nom>
      <Prenom>{$etud/Personne/Prenom/text()}</Prenom>
    {
     for $matAnnee in $etud//MatieresParAnnee
     return
     <Annee valeur="{$matAnnee/@Annee}">
     {
          for $matEtud in $matAnnee/MatID,
              $mat in $matieres//Matiere
          where $matEtud/@MatiereID = $mat/@ID and avg($matEtud/Note/text()) < 10
          return
             <Matiere>
               <Nom>{$mat/Nom/text()}</Nom>
               <Moyenne>{avg($matEtud/Note/text())}</Moyenne>
             </Matiere>
      }
      </Annee>
    }
    </Etudiant>
}
</ans>