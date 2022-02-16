# This program illustrates the basic use of the SimpleMarkup
# class. It extracts the first comment block from the
# simple_markup.rb file and converts it into HTML on
# standard output. Run it using
#
#  % ruby sample.rb
#
# You should be in the sample/rdoc/markup/ directory when you do this,
# as it hardwires the path to the files it needs to require.
# This isn't necessary in the code you write once you've
# installed the package.
#
# For a better way of formatting code comment blocks (and more)
# see the rdoc package.
#

require 'rdoc'

# Extract the comment block from the source file

input_string = ""

File.foreach(File.expand_path("../../../lib/rdoc/markup.rb", __dir__)) do |line|
  break unless line.gsub!(/^\# ?/, "")

  input_string << line
end

# Create an HTML RDoc::Markup converter
h = RDoc::Markup::ToHtml.new(RDoc::Options.new)

# And convert out comment blocks to html. Wrap it a body
# tag pair to let browsers view it

puts "<html><body>"
puts h.convert(input_string)
puts "</body></html>"
