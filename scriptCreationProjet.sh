RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color
echo -e "——${RED} Quel est le nom du projet ?${NC} "

read projectName

# Creation des dossiers
echo -e "##### ${GREEN}CREATION DES DOSSIERS${NC} #####  "
mkdir $projectName
cd $projectName
mkdir assets 
mkdir assets/js
mkdir assets/html
mkdir assets/css
mkdir assets/img


# Creation des Fichiers
echo -e "##### ${GREEN}CREATION DES FICHIERS ${NC}#####"
touch index.html
touch assets/css/style.css
touch .gitignore

# Ajout d'ignore git
echo -e "#####${GREEN} GESTION DU GIT IGNORE ${NC}#####"
echo "node_modules" >> .gitignore
echo "*.DS_Store" >> .gitignore
echo "_Consigne*" >> .gitignore

# HTML > 1ère phase
echo '<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon projet</title>

' >> index.html

# Ajout de modules
echo -e "#####${GREEN} GESTION DES MODULES ${NC}#####"
npm init -y

bootstrap="yes no"
echo -e "——${RED} Installer bootstrap ?${NC} "

select opt in $bootstrap; do
case $opt in
    yes)
      echo -e "$opt > ${GREEN} Ça roule je vous installe ça!${NC}"
      npm install bootstrap@next
      echo '<!-- ************************** BOOTSTRAP ********************************* -->
      <link rel="stylesheet" href="./node_modules/bootstrap/dist/css/bootstrap.min.css"/>' >> index.html
      break
      ;;
    no)
      echo -e "$opt >${GREEN} ok! Pas de Bootstrap!${NC}"
      break
      ;;
    * )
      echo -e "$opt >${YELLOW} Ce n'est pas un choix valide. merci de choisir une option valide!${NC}"
      continue
  esac
done


fontAwesome="yes no"

echo -e "——${RED} Installer FontAwesome ?${NC} "
select opt in $fontAwesome; do
case $opt in
    yes)
      echo -e "$opt >${GREEN} Ça roule je vous installe ça!${NC}"
      npm install --save @fortawesome/fontawesome-free
      echo '<!-- ****************************** LIEN FONT AWESOME ******************** -->
      <link rel="stylesheet" href="./node_modules/@fortawesome/fontawesome-free/css/all.css"/>' >> index.html
      
      break
      ;;
    no)
      echo -e "$opt >${GREEN} ok! Pas de Font Awesome!${NC}"
      break
      ;;
    * )
      echo -e "$opt >${YELLOW} Ce n'est pas un choix valide. merci de choisir une option valide!${NC}"
      continue
      ;;
  esac
done


style="Css_Simple Scss Sass"

echo -e "—— ${RED}Quel type de fichier style?${NC} "

select opt in $style; do
case $opt in
    Css_Simple)
      echo -e "$opt >${GREEN}  Ok! Juste le bon vieux Css classique!${NC}"
      break
      ;;
    Scss)
      echo -e " $opt >${GREEN} Ok! Je vous fait une arbo Scss!${NC}"
      mkdir assets/scss
      touch assets/scss/style.scss
      break
      ;;
    Sass)
      echo -e "$opt >${GREEN}  Ok! Je vous fait une arbo Sass!${NC}"
      mkdir assets/sass
      touch assets/sass/style.sass
      break
      ;;
    * )
      echo -e "$opt >${YELLOW}Ce n'est pas un choix valide. merci de choisir une option valide!${NC}"
      continue
      ;;
  esac
done

# AJOUT DU FICHIER CSS PERSONNEL
echo -e "#####${GREEN} LINK DU STYLE.CSS ${NC}#####"
echo '<!-- ****************************** MY CSS ******************** -->
      <link rel="stylesheet" href="./assets/css/style.css">' >> index.html


# FINALISATION DU FICHIER HTML
echo -e "##### ${GREEN}FINALISATION DU INDEX.HTML ${NC}#####"
echo '</head>
<body>

    <!-- ****** HEADER ******  -->
    <header>
        <h1>   </h1>
        <nav>
           
        </nav>
    </header>

    <!-- ****** MAIN ******  -->
    <main>
        
    </main>

    <!-- ****** FOOTER ******  -->
    <footer>

    </footer>

</body>
</html>' >> index.html


echo -e "#####${GREEN} VOTRE FICHIER EST PRÊT ! ${NC}#####"


watch="Non,Rien! Scss Sass"
echo -e "——${RED} Dois-je watcher un truc ?${NC} "

select opt in $watch; do
case $opt in
    Non,Rien!)
      echo -e "$opt >${GREEN} Ok. Je lance juste le projet${NC}"
      code ./
      break
      ;;
    Scss)
      echo -e "$opt >${GREEN} Ok je vous watche le Scss${NC}"
      code ./
      sass --watch assets/scss/style.scss assets/css/style.css

      break
      ;;
    Sass)
      echo -e "$opt >${GREEN} Ok je vous watche le Sass${NC}"
      code ./
      sass --watch assets/sass/style.sass assets/css/style.css
      break
      ;;
    *) 
      echo -e "$opt >${YELLOW} Ce n'est pas un choix valide. merci de choisir une option valide!${NC}"
      continue
      ;;
  esac
done