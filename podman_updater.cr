system(`podman images`
        .split("\n")[1..-2]
        .map { |i| j=i.gsub(/\s+/m, ' ').strip.split(" "); j[0] + ":" + j[1] }
        .reject { |i| i.ends_with?("<none>") }
        .map { |i| "podman pull #{i} ;" }
        .join)
