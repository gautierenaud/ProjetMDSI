let $listCursus := doc("../BD/ListCursus.xml")
let $matieres  := doc("../BD/Matiere.xml")

return
<ans>
{
  for $cursus in $listCursus//Cursus
  return
    <Cursus>
      <Nom>{$cursus/@CursusName}</Nom>
      {
        for $uf in $cursus/UF
        return
          <UF>
            <Code>{$uf/@ID}</Code>
            {
              for $ufMat in $uf/MatID,
                  $mat in $matieres//Matiere
              where $ufMat/@ID = $mat/@ID
              return
                $mat
            }
          </UF> 
      }
    </Cursus>
}
</ans>