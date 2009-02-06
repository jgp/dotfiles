autoload -U compinit && compinit
autoload colors && colors
autoload -U zmv

for file ($CONF/functions/*.sh)   { load $file }
for file ($CONF/aliases/*.sh)     { load $file }
for file ($CONF/setup/*.sh)       { load $file }
for file ($CONF/completion/*.sh)  { load $file }
for file ($CONF/environment/*.sh) { load $file }
for file ($CONF/prompt/*.sh)      { load $file }

echo "Zdar velky `whoami` :)"