resource "kubectl_manifest" "addr_pool" {
  yaml_body = <<YAML

apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: addr-pool
  namespace: metallb-system
spec:
  addresses:
  - 192.168.39.220-192.168.39.230

YAML

  depends_on = [helm_release.metallb]
}
