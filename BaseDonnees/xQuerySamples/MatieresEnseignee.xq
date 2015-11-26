let $enseignants := doc("../Enseignant.xml")
let $matieres := doc("../Matiere.xml")
return
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
    