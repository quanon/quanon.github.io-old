import webpack from 'webpack';
import ExtractTextPlugin from 'extract-text-webpack-plugin';
import CleanWebpackPlugin from 'clean-webpack-plugin';

const cleanPlugin = new CleanWebpackPlugin(['build']);
const extractScssPlugin = new ExtractTextPlugin('stylesheets/[name].css');
const extractFontPlugin = new ExtractTextPlugin('fonts/[name].ttf');
const providePlugin = new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  'window.jQuery': 'jquery'
});

export default {
  entry: {
    index: [
      './source/stylesheets/site.scss',
      './source/javascripts/all.js'
    ]
  },

  resolve: {
    root: `${__dirname}/source/javascripts`,
  },

  output: {
    path: `${__dirname}/build`,
    filename: 'javascripts/[name].js',
  },

  module: {
    loaders: [
      {
        test: /source\/javascripts\/.*\.js$/,
        exclude: /node_modules|\.tmp|vendor/,
        loader: 'babel-loader'
      },
      {
        test: /.*\.scss$/,
        loader: extractScssPlugin.extract(
          'style-loader',
          `css-loader!sass-loader?sourceMap&includePaths[]=${__dirname}/node_modules`
        )
      },
      {
        test: /source\/fonts\/.*\.ttf$/,
        loader: extractFontPlugin.extract('file-loader')
      },
      {
        test: /\.css$/,
        loader: 'style-loader!css'
      },
      {
        test: /\.woff(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'url-loader?limit=10000&mimetype=application/font-woff'
      },
      {
        test: /\.woff2(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'url-loader?limit=10000&mimetype=application/font-woff'
      },
      {
        test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'url-loader?limit=10000&mimetype=application/octet-stream'
      },
      {
        test: /\.eot(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'file-loader'
      },
      {
        test: /\.svg(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'url-loader?limit=10000&mimetype=image/svg+xml'
      }
    ]
  },

  plugins: [cleanPlugin, extractScssPlugin, extractFontPlugin, providePlugin]
};
