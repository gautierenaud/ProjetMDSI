xquery version "1.0";
let $etudiants := doc("../BD/Etudiant.xml")
return 
<ans>
  
    {
      for $etudiant in $etudiants//Etudiant
          return
          <etudiant name="{$etudiant/Personne/Nom}">
          {
              for $matiereParAnnee in $etudiant/Matieres/MatieresParAnnee
              where $matiereParAnnee/@Annee != $etudiants//Etudiant/AnneeActuelle/text()
              
               return 
               <Matiere>
                 <Moyennes>
                   {  
                       sum($matiereParAnnee/MatID/Note) div count($matiereParAnnee/MatID/Note)
                     
                   }
                 </Moyennes>
               </Matiere> 
               
            
          }
            </etudiant>
    }
  
 </ans>