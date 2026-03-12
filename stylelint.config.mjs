export default {
  extends: ["stylelint-config-standard-scss"],
  plugins: ["@stylistic/stylelint-plugin"],
  rules: {
    "color-function-notation": null,
    "color-function-alias-notation": null,
    "alpha-value-notation": null,
    "@stylistic/indentation": 2,
    "@stylistic/declaration-colon-space-after": "always-single-line",
    "@stylistic/declaration-colon-space-before": "never",
    "@stylistic/no-eol-whitespace": true,
    "@stylistic/string-quotes": "double"
  }
};