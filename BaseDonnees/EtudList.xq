let $file := doc("bd.xml")
return
<ans>
  <NbEtud>Nombre d étudiants: {$file/count(//Etudiant)}</NbEtud>
  <Etudiants>
    {for $etud in $file//Etudiant
      return
      <Etudiant>
        {$etud//Nom}
      </Etudiant>
    }
  </Etudiants>
</ans>