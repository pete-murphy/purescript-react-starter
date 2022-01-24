# PureScript React Basic Template

## Getting started

Install all the dependencies and compile the app with

```shell
npm install && npm run build
```

To run the app

```shell
npm run start
```

and open a browser to `localhost:1234`

## Adding a PureScript dependency

For example, let's add [`affjax`](https://github.com/purescript-contrib/purescript-affjax) and [`checked-exceptions`](https://github.com/natefaubion/purescript-checked-exceptions)

```shell
npx spago install affjax checked-exceptions
npm run build
```

(Note that `affjax` will also require the NPM dependency `xhr2`)
```shell
npm install -D xhr2
```
