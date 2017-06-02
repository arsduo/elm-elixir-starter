# 1) Start up and ensure the working directory is clean and necessary tools are installed.

RED='\033[0;31m'
BOLD='\033[1m'
NO_COLOR='\033[0m'

echo
echo "🌲  ⚗  ${BOLD}ELM+ELIXIR STARTER CONFIGURATION${NO_COLOR} ⚗  🌲 "
echo
echo "Welcome! Let's get your project customized so that you can get started with Elm and Elixir 😎"
echo

git status | grep "nothing to commit, working tree clean" > /dev/null
if [[ $? -ne 0 ]]
then
  echo "${RED}This script requires a clean working directory; you have changes (check out git status)."
  echo "Stash or commit those changes and try again.${NO_COLOR}"
  echo
  exit 1
fi

which mix > /dev/null
if [[ $? -ne 0 ]]
then
  echo "${RED}This script requires a Elixir to be installed and the mix command to be available; mix could not be found."
  echo "Check out https://elixir-lang.org/install.html for instructions.${NO_COLOR}"
  echo
  exit 1
fi

which yarn > /dev/null
if [[ $? -ne 0 ]]
then
  echo "${RED}This script requires yarn to be installed for Javascript dependencies; it couldn't be found."
  echo "Check out https://yarnpkg.com/en/docs/getting-started for instructions. ${NO_COLOR}"
  echo
  exit 1
fi

# 1) Get the app name of the application from the user

echo "Enter the snake_case name of your project. (This will be the name of your Elixir app.)\n"
printf "> "
read appSnakeCaseName
printf "\n"

echo "Enter the CamelCase name of your project, first letter capitalized. (This will be the name of your Elixir namespace.)\n"
printf "> "
read appCamelCaseName
printf "\n"

# 2) find and replace the old names in all the application files
# we can't run find on . because it would corrupt git
# see https://stackoverflow.com/questions/1583219/awk-sed-how-to-do-a-recursive-find-replace-of-a-string
directoriesToRenameIn=(config lib priv "test" web)
filesToRenameIn=(mix.exs)

printf "Replacing text in files..."

for replacementString in "s/elmelixirstarter/${appSnakeCaseName}/g"  "s/Elmelixirstarter/${appCamelCaseName}/g"
do
  for dir in "${directoriesToRenameIn[@]}"
  do
    find "${dir}" -type f \( -name \*.ex -o -name \*.exs -o -name \*.yml \) -print0 | xargs -0 sed -i '' "${replacementString}"
  done

  for file in "${filesToRenameIn[@]}"
  do
    sed -i '' "${replacementString}" "${file}"
  done
done

sed -i '' "s/Elm Elixir Starter/${appCamelCaseName}/g" web/templates/layout/app.html.eex

printf "done!\n\n"

# 3) Rename files

mv lib/elmelixirstarter "lib/${appSnakeCaseName}"
mv lib/elmelixirstarter.ex "lib/${appSnakeCaseName}.ex"

# 4) Optional: replace some stuff for Elm

echo "Optional: enter the git repository URL for your account (e.g. https://github.com/arsduo/elm-elixir-starter.git). (This is used in the Elm package and linting.)"
echo "You can skip this, in which case elm/elm-package.json and scripts/elm-lint.sh will refer to the original elm-elixir-starter repo.\n"
printf "> "
read repoURL
printf "\n"

if [[ -n "$repoURL" ]]
then
  gitUsernameRegex="github\.com\/(.*)\/"
  if [[ "${repoURL}" =~ $gitUsernameRegex ]]
  then
    githubUsername="${BASH_REMATCH[1]}"
    # use another separator than / to avoid having to escape the repoURL
    sed -i '' "s%https://github.com/arsduo/elm-elixir-starter.git%${repoURL}%g" elm/elm-package.json
    sed -i '' "s/arsduo/${githubUsername}/g" scripts/elm-lint.sh
  else
    echo "${RED}Unable to determine Github username from that URL!"
    echo "You can revert all git changes using 'git checkout -f' and try again.${NO_COLOR}"
    echo
    exit 1
  fi
fi

# 4) Copy development.env.example

cp development.env.example development.env

# 5) Stage it all on Git

git add .

# 6) Get dependencies

echo "Getting dependencies..."

mix deps.get # Elixir
yarn install # Javascript

# 7) Tell the user what we've done

echo "Done with the automated setup!"
echo
echo "To see all the files that have been changed, run: git status"
echo
echo "Next steps:"
echo "* ${BOLD}Make sure to set up your database and Twitter app in development.env!${NO_COLOR}"
$echo "* ${BOLD}After that, you can boot up your Docker environment and create the database, as described in the readme"
echo
echo "If you want to receive future updates, run: git remote add upstream git@github.com:arsduo/elm-elixir-starter.git"
echo


