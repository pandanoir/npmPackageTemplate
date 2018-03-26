This repository is a template of the npm package.

# How to use

1. rename this directory from npmPackageTemplate
1. run `sh init.sh`
1. remove README.md and write your own README.md

## How to update your package

1. commit all changes.
1. run `npm version [major | minor | patch]`
1. run `npm publish`

# install PostCSS

```
$ yarn add -D gulp@next gulp-postcss reify
```

gulpfile.js

```javascript
import {src, dest} from 'gulp';
import postcss from 'gulp-postcss';

export default () => src('src/css/*.css')
    .pipe(postcss([]))
    .pipe(dest('dist/css'));
```
