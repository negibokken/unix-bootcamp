exit if fork
Dir.chdir "/"
puts Process.pid
STDIN.reopen "/dev/null"
STDOUT.reopen "/dev/null", "a"
STDERR.reopen "/dev/null", "a"

