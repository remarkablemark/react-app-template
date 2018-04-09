const webpack = require('webpack');

/**
 * Config overrides.
 *
 * https://github.com/timarney/react-app-rewired#extended-configuration-options
 */
module.exports = (config, env) => {
  if (process.env.NODE_ENV === 'production') {
    config.plugins.push(new webpack.IgnorePlugin(/^react-hot-loader$/));
  }
  return config;
};
