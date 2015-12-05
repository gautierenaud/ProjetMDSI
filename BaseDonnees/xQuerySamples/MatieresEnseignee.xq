let $enseignants := doc("../BD/Enseignant.xml")
let $matieres := doc("../BD/Matiere.xml")
return
<ans>
{
  for $enseign in $enseignants//Enseignant
  order by $enseign
  return
  <Enseignant>
    {$enseign/Personne}
    {
      for $mat in $matieres//Matiere,
          $enseignMat in $enseign/MatID
      where $mat/@ID=$enseignMat/@MatiereID
      return
        $mat
    }
  </Enseignant>
}
</ans>