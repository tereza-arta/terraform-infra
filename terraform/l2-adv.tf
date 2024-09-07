resource "kubectl_manifest" "l2_adv" {
  yaml_body = <<YAML

apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: l2-adv
  namespace: metallb-system
spec:
  ipAddressPools:
  - addr-pool

YAML

  depends_on = [kubectl_manifest.addr_pool]
}
