# A simple script to compile your Elm project and check it for warnings.
cd elm

# First, does it compile successfully?
elm-make Main.elm --output /tmp/elm-linting.html --warn &> /tmp/elm-linting-output
if [[ $? -ne 0 ]]; then
  echo "Failed to compile Elm!\n\n"
  cat /tmp/elm-linting-output
  exit 1
fi

# Second, were there any linter warnings?
grep WARNINGS /tmp/elm-linting-output > /dev/null
if [[ $? -eq 0 ]]; then
  echo "\nElm linting failed!\n\n"
  cat /tmp/elm-linting-output
  exit 1
fi

echo "Compiling and linting succeeded!\n\n"
cat /tmp/elm-linting-output
exit 0