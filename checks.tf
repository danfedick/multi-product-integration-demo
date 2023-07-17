check "vault_health_check" {
  data "http" "vault_cluster" {
    url = "${hcp_vault_cluster.hashistack.vault_public_endpoint_url}/ui/"
  }

  assert {
    condition     = data.http.vault_cluster.status_code == 200
    error_message = "${var.stack_id}-vault-cluster returned an unhealthy status code"
  }
}

check "consul_health_check" {
  data "http" "consul_cluster" {
    url = hcp_consul_cluster.hashistack.consul_public_endpoint_url
  }

  assert {
    condition     = data.http.consul_cluster.status_code == 200
    error_message = "${var.stack_id}-consul-cluster returned an unhealthy status code"
  }
}

check "boundary_chealth_check" {
  data "http" "boundary_cluster" {
    url = hcp_boundary_cluster.hashistack.cluster_url
  }

  assert {
    condition     = data.http.boundary_cluster.status_code == 200
    error_message = "${var.stack_id}-boundary-cluster returned an unhealthy status code"
  }
}