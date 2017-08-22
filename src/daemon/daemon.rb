def daemonize_app
  puts "daemon"
  # if RUBY_VERSION < "1.9"
  if true
    exit if fork    # ①
    puts Process.setsid    # ②
    exit if fork    # ③
    Dir.chdir "/"    # ④
    STDIN.reopen "/dev/null"    # ⑤
    STDOUT.reopen "/dev/null", "a"    # ⑤
    STDERR.reopen "/dev/null", "a"    # ⑤
    puts Porcess.pid
  else
    Process.daemon
    Porcess.pid
  end
end

daemonize_app()
