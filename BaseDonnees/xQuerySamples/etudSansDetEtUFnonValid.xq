xquery version "1.0";
declare namespace functx = "http://www.functx.com";
declare function functx:value-except
  ( $arg1 as xs:anyAtomicType* ,
    $arg2 as xs:anyAtomicType* )  as xs:anyAtomicType* {

  distinct-values($arg1[not(.=$arg2)])
 } ;

let $etudiants := doc("../BD/Etudiant.xml")
let $listEtudiant := $etudiants//Etudiant
return
<ans>
  {
    
   let $et:= for $etudiant in $etudiants//Etudiant,
        $matiereParAnnee in $etudiant/Matieres/MatieresParAnnee,
        $matID in $matiereParAnnee/MatID
         where $matiereParAnnee/@Annee != $etudiant/AnneeActuelle/text()
          and avg($matID/Note)<10
          return $etudiant
   
    let $res := functx:value-except($listEtudiant/Personne/Nom,$et/Personne/Nom)
      
  
    let $etudSUFV := for $etudiant in $listEtudiant,
                     $matiereParAnnee in $etudiant/Matieres/MatieresParAnnee,
                     $matID in $matiereParAnnee/MatID
                      where $etudiant/Personne/Nom = $res 
                      and $matiereParAnnee/@Annee = $etudiant/AnneeActuelle/text()
                       and avg($matID/Note)<10
                      return $etudiant
    return $etudSUFV/Personne/Nom
                           
                  
  }
</ans>
 
