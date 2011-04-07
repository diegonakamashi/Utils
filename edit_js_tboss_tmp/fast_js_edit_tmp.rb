#!/usr/bin/env ruby

JBOSS_DEPLOY_PATH='/usr/local/jboss/server/default'


def get_all_js
  Dir.chdir(JBOSS_DEPLOY_PATH)
  if ( File.directory? 'tmp' )
    Dir.chdir('tmp')
    jsfiles_join = File.join("**", "*.js")
    js_files = Dir.glob(jsfiles_join)
  end
  Dir.chdir(JBOSS_DEPLOY_PATH)
  return js_files
end


def get_js_path js_name, js_list
  js_list.each do |js|
    return js if js.match /\/#{js_name}\d.\d.\d.js/
  end
  ""
end



if(ARGV.size > 0)
  js_list = get_all_js
  js_path = get_js_path ARGV[0], js_list
  
  system("gedit #{JBOSS_DEPLOY_PATH}/tmp/#{js_path}")
  
else
  puts "Passe o nome do js como argumento"  
end    
    

