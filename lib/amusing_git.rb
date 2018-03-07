project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/amusing_git/**/*.rb', &method(:require))
