const webpack = require('webpack');
const TerserPlugin = require('terser-webpack-plugin');
const { merge } = require('webpack-merge');
const common = require('./common.js');

const prodConfig = () => merge(common, {
  stats: 'minimal',
  optimization: {
    splitChunks: {
      chunks: 'all',
      maxSize: 240000, // Découper en morceaux de 240 KiB max
      minSize: 20000, // Taille min pour scinder un chunk
      maxInitialRequests: 30, // Augmente le nombre de requêtes concurrentes
      maxAsyncRequests: 30,
      cacheGroups: {
        vendors: {
          test: /[\\/]node_modules[\\/]/,
          name: 'vendors',
          chunks: 'all',
          enforce: true,
        },
        graphql: {
          test: /[\\/]node_modules[\\/](graphql|apollo-client|apollo-.*)[\\/]/,
          name: 'graphql',
          chunks: 'all',
          enforce: true,
        },
    }},
    minimizer: [
      new TerserPlugin({
        sourceMap: true,
        terserOptions: {
          output: {
            comments: /@license/i,
          },
        },
        extractComments: false,
      }),
    ],
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env.NODE_ENV': JSON.stringify('production'),
    }),
  ],
});

module.exports = prodConfig;
