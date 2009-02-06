function _mategem {
    reply=($(ls "$(gem environment gemdir)/gems"))
}
compctl -K _mategem mategem.sh

# Project
# project Get
# project Get --ruby
function _project_types { reply=($(ls ~/Config/Projects/General | sed 's/\.rb$//' | sed 's/^/--/')) }
compctl -K _project_types project.rb

function _projects { reply=($(ruby -rterminal/helper -e 'puts Helper.completion')) }
# projit config/projects/general/*.rb => paths
compctl -K _projects project.rb
# compctl -K projects -K _project_types project

compdef _gnu_generic irb
compdef _gnu_generic rake
compdef _gnu_generic merb
compdef _gnu_generic merb-gen
compdef _gnu_generic thor