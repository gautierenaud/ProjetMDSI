let $etudiants := doc("../BD/Etudiant.xml")
let $matieres  := doc("../BD/Matiere.xml")

return
<ans>
{
  for $etud in $etudiants//Etudiant
  return
    <Etudiant id="{$etud/Personne/@ID}">
      <Nom>{$etud/Personne/Nom/text()}</Nom>
      <Prenom>{$etud/Personne/Prenom/text()}</Prenom>
      {
      for $matAnnee in $etud//MatieresParAnnee
      return
        <Annee valeur="{$matAnnee/@Annee}">
          <MoyenneGenerale>{avg($matAnnee/MatID/Note/text())}</MoyenneGenerale>
        </Annee>
      }
    </Etudiant>
}
</ans>