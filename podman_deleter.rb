# This tool just deletes docker images tagged with "<none>" because in my case they are usually leftovers after update
`podman images`
  .split("\n")
  .drop(1).map { |i| i.split(' ') }
  .select { |i| i[1] == '<none>' }
  .map { |i| i[2] }
  .each { |i| system("docker rmi #{i}") }
