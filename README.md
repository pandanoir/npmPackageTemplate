This repository is a template of the npm package.

# How to use

1. rename this directory from npmPackageTemplate
1. run `npm init --yes`
1. run `npm install --save-dev mocha rollup`
1. replace scripts in package.json with following codes
    ```json
      "scripts": {
        "preversion": "npm test",
        "version": "npm run build && gulp && git add -A",
        "postversion": "git push && git push --tags",
        "pretest": "npm run build",
        "test": "mocha -R spec",
        "build": "rollup src/main.js -c -o dist/sample.js --name Sample"
      }
    ```
    also change "Sample" and "dist/sample.js" in build command to whatever you want to use.

1. replace main in package.json with "dist/sample.js"
1. rewrite description in package.json
1. write src/main.js
1. write src/test.js
1. remove README.md and write your own README.md

## How to update your package

1. commit all changes.
1. run `npm version [major | minor | patch]`
1. run `npm publish`
