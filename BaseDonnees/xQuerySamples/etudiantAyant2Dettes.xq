xquery version "1.0";
let $etudiants := doc("../BD/Etudiant.xml")
return 
<ans>
   <etudiants>
    {
     for $etudiant in $etudiants//Etudiant,
                            $matiereParAnnee in $etudiant/Matieres/MatieresParAnnee,
                             $matID in $matiereParAnnee/MatID
                              where $matiereParAnnee/@Annee != $etudiant/AnneeActuelle/text()
                              and sum($matID/Note) div count($matID/Note) < 10
                               return count( $matiereParAnnee)
       
     
       
           
           
           
              
    }
     </etudiants>
 </ans>