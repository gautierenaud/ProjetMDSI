let $etudiants := doc("../BD/Etudiant.xml")
let $matieres  := doc("../BD/Matiere.xml")

return
<ans>
{
  for $etud in $etudiants//Etudiant
  return
    <Etudiant>
    {$etud/Personne/Nom}
    {$etud/Personne/Prenom}
    {
     for $matAnnee in $etud//MatieresParAnnee
     return
     <Annee valeur="{$matAnnee/@Annee}">
     {
          for $matEtud in $matAnnee/MatID,
              $mat in $matieres//Matiere
          where $matEtud/@MatiereID = $mat/@ID
          return
            <Matiere>{$mat/Nom/text()}</Matiere>
      }
      </Annee>
    }
    </Etudiant>
}
</ans>