import path from 'path';
import webpack from 'webpack';
import CleanWebpackPlugin from 'clean-webpack-plugin';

const cleanPlugin = new CleanWebpackPlugin(['build']);
const providePlugin = new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  'window.jQuery': 'jquery'
});

export default {
  entry: {
    index: [
      './source/javascripts/all.js'
    ]
  },

  resolve: {
    modules: [
      path.resolve(__dirname, 'source/javascripts'),
      'node_modules'
    ]
  },

  output: {
    path: path.resolve(__dirname, 'build'),
    filename: 'javascripts/[name].js',
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules|\.tmp|vendor/,
        use: 'babel-loader'
      }, {
        test: /\.(css|scss)$/,
        use: ['style-loader', 'css-loader', 'sass-loader']
      }, {
        test: /\.woff(\?v=\d+\.\d+\.\d+)?$/,
        use: {
          loader: 'url-loader',
          options: {
            limit: 10000,
            mimetype: 'application/font-woff'
          }
        }
      }, {
        test: /\.woff2(\?v=\d+\.\d+\.\d+)?$/,
        use: {
          loader: 'url-loader',
          options: {
            limit: 10000,
            mimetype: 'application/font-woff'
          }
        }
      }, {
        test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/,
        use: {
          loader: 'url-loader',
          options: {
            limit: 10000,
            mimetype: 'application/octet-stream'
          }
        }
      }, {
        test: /\.eot(\?v=\d+\.\d+\.\d+)?$/,
        use: 'file-loader'
      }, {
        test: /\.svg(\?v=\d+\.\d+\.\d+)?$/,
        use: {
          loader: 'url-loader',
          options: {
            limit: 10000,
            mimetype: 'image/svg+xml'
          }
        }
      }
    ]
  },

  plugins: [cleanPlugin, providePlugin]
};
