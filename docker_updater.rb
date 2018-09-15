#!/usr/bin/ruby
`docker images`
  .split("\n")
  .drop(1)
  .map { |i| j=i.split(' '); j[0] + ':' + j[1] }
  .reject { |i| i.end_with?('<none>') }
  .each { |i| system("docker pull #{i}") }
