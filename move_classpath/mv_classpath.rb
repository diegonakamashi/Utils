#!/usr/bin/env ruby

require 'rexml/document'

project_path='/home/dnakamashi/dev/workspace/java/support_tools/serviceclassgenerator'
dest_path='/home/dnakamashi/dev/workspace/java/support_tools/serviceclassgenerator/WebContent/WEB-INF/lib/'


xml = File.read("#{project_path}/.classpath")

doc, jars = REXML::Document.new(xml), []
doc.elements.each('classpath/classpathentry') do |element|
  jars << element.attributes['path'] if element.attributes['kind'] == 'lib'       
end

jars.each do |jar|
  puts "coping #{jar} to #{dest_path}"
  system("cp #{jar} #{dest_path}")
end



