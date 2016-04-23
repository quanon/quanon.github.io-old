###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

module MiddlemanHelper
  def favorite_items(title, key, is_divided = true)
    locals = { title: title, items: key, is_divided: is_divided }
    partial(:favorite_items, locals: locals)
  end

  def selection_items(title, key)
    locals = { title: title, items: key }
    partial(:selection_items, locals: locals)
  end

  def divide_array(array, number)
    array.each_slice(number).to_a
  end

  def n2br(string)
    string.gsub("\n", '<br />').html_safe
  end
end

helpers do
  include MiddlemanHelper
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

set :slim, format: :html

activate :external_pipeline,
  name: :webpack,
  command: build? ?
    './node_modules/webpack/bin/webpack.js --bail -p' :
    './node_modules/webpack/bin/webpack.js --watch -d',
  source: 'build',
  latency: 1

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.branch = :master
  deploy.build_before = true
end
