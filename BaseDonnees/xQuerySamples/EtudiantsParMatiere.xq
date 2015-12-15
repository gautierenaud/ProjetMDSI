let $etudiants := doc("../BD/Etudiant.xml")
let $matieres  := doc("../BD/Matiere.xml")

return
<ans>
{
  for $mat in $matieres//Matiere
  return
    <Matiere>
      <Name>{$mat/Nom/text()}</Name>
      <Etudiants>
    {
       for $etud in $etudiants//Etudiant
       where $etud//MatID/@MatiereID=$mat/@ID
       return
         <Etudiant>
           <Nom>{$etud//Nom/text()}</Nom>
           <Prenom>{$etud//Prenom/text()}</Prenom>
         </Etudiant>
    }
    </Etudiants>
    </Matiere>
}
</ans>