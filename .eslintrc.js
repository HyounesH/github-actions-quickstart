module.exports = {
    root: true,
    parser: '@typescript-eslint/parser',
    parserOptions: {
      ecmaVersion: 2020,
      sourceType: 'module'
    },
    env: {
      node: true,
      jest: true
    },
    extends: [
      'eslint:recommended',
      'plugin:@typescript-eslint/recommended'
    ],
    rules: {
      '@typescript-eslint/no-explicit-any': 'warn'
    }
  };
  