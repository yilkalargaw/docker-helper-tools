# This tool just deletes docker images tagged with "<none>" because in my case they are usually leftovers after update
system(`podman images`
        .split("\n")[1..-2]
        .map { |i| i.gsub(/\s+/m, ' ').strip.split(" ") }
        .select { |i| i[1] == "<none>" }
        .map { |i| "podman rmi #{i[2]} ;" }
        .join)
