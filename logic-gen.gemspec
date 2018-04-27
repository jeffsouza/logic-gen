Gem::Specification.new do |s|
  s.name        = 'logic-gen'
  s.version     = '0.0.1'
  s.date        = '2018-04-26'
  s.summary     = "Logic files generator"
  s.description = "Generate logic folders and files to organize a rails project"
  s.authors     = ["Jefferson de Souza"]
  s.email       = 'jeffsouza@gmail.com'
  s.files       = ["lib/logic-gen.rb", 
                   "lib/generators/logicgen/all/all_generator.rb",
                   "lib/generators/logicgen/config/config_generator.rb",
                   "lib/generators/logicgen/controller/controller_generator.rb"]
  s.license       = 'MIT'
end
