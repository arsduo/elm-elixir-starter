# A simple script to compile your Elm project and check it for warnings.
#
# This won't be necessary when elm-make has a flag to fail on warnings (see
# https://github.com/elm-lang/elm-make/issues/108) but for now unfortunately we have to parse the
# output.
#
# I'm sure someone with bash expertise could make this cleaner, but it works.


cd elm
# Remove any previously-compiled Elm artifacts to ensure we compile and lint everything
rm -rf elm-stuff/build-artifacts/0.18.0/arsduo

# First, does it compile successfully?
elm-make Main.elm --yes --output /tmp/elm-linting.html --warn &> /tmp/elm-linting-output
if [[ $? -ne 0 ]]; then
  echo "Failed to compile Elm!"
  cat /tmp/elm-linting-output
  exit 1
fi

# Second, were there any linter warnings?
grep WARNINGS /tmp/elm-linting-output > /dev/null
if [[ $? -eq 0 ]]; then
  echo "\nElm linting failed!"
  cat /tmp/elm-linting-output
  exit 1
fi

echo "Compiling and linting succeeded!"
cat /tmp/elm-linting-output
exit 0