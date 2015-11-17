for $etud in doc("bd.xml")//Etudiant
    order by $etud//Cursus
    return
    <Etudiant>
      Nom: {$etud//Nom}
      <Cursus>{$etud//Cursus}</Cursus>
    </Etudiant>
