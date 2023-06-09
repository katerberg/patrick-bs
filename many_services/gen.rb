N = 100

(1..N).each do |i|
  f = File.new("service-#{i}.yaml", "w")
  f.puts(
    <<-EOT
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: service-#{i}
  description: A test service
spec:
  type: service
  lifecycle: alpha
  owner: team-b
    EOT
  )
  f.close
end

f = File.new("all.yaml", "w")
f.puts(
  <<-EOT
apiVersion: backstage.io/v1alpha1
kind: Location
metadata:
  name: example-services
  description: A collection of a number of backstage test entities
spec:
  targets:
    EOT
)
(1..N).each do |i|
  f.puts("    - ./service-#{i}.yaml")
end
f.close()
