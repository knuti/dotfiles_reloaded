SCRIPTS = {
  psql: "-w /usr/local/opt/postgresql/homebrew.mxcl.postgresql.plist",
  pg: "-w /usr/local/opt/postgresql/homebrew.mxcl.postgresql.plist",
  mysql: "-w /usr/local/opt/mysql/homebrew.mxcl.mysql.plist",
  memcached: "/usr/local/opt/memcached/homebrew.mxcl.memcached.plist",
  es: "/usr/local/Cellar/elasticsearch/1.5.2/homebrew.mxcl.elasticsearch.plist",
  re: "-w /usr/local/Cellar/redis/3.2.8/homebrew.mxcl.redis.plist"
}

ACTIONS = {
  start: "load",
  stop: "unload"
}

action = ACTIONS[ARGV[0].to_sym]
script = SCRIPTS[ARGV[1].to_sym]

exec "launchctl #{action} #{script}"


# if ARGV[0] == "all"
#   SCRIPTS.each { |_, v| exec "launchctl load #{v}" }
# elsif ARGV[0] == "ah24"
#   pg, es, re
# end
