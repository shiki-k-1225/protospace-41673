const path = require('path');

module.exports = {
  entry: './app/javascript/packs/application.js',
  output: {
    path: path.resolve(__dirname, 'public/packs'),
    filename: 'bundle.js'
  },
  mode: 'production'
};
