job "vaulttest" {
  datacenters = ["dc1"]
  type = "service"
  group "web" {
    task "nginx" {
      driver = "docker"
      config { image = "nginx" }
      vault {
        policies = ["default"]
        allow_token_expiration = true
        change_signal = "SIGUSR1"
      }
    }
  }
}
