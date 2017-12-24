#!bin/sh
rm -rf .git
if type npm >/dev/null 2>&1; then
    echo "init npm"
    npm init --yes
    npm install --save-dev mocha rollup
    echo "done"
else
    echo "you must install npm!"
    exit 1
fi

echo "making src/ and test/..."
mkdir src
mkdir test
touch src/main.js
touch test/main.js
echo "done"

name=$(basename `pwd`)
moduleName=$(echo|awk -v "var=$name" "{print toupper(substr(var,1,1))substr(var,2);}")
fileName=$(echo|awk -v "var=$name" "{print tolower(substr(var,1,1))substr(var,2);}")

sed -e 's/"test": ".*"/"preversion": "npm test",\n    "version": "npm run build \&\& gulp \&\& git add -A",\n    "postversion": "git push \&\& git push --tags",\n    "pretest": "npm run build",\n    "test": "mocha -R spec",\n    "build": "rollup src\/main.js -c -o dist\/'$fileName'.js --name '$moduleName'"/g' -e 's/"main": ".*"/"main": "dist\/'$fileName'.js"/g' package.json > package.tmp.json
cp package.tmp.json package.json
rm package.tmp.json

