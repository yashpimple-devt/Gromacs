provider "google" {
  credentials = file("xerocodee.json")
  project     = "xerocodee"
  region      = "us-central1"
}

resource "google_compute_network" "my_network" {
  name                    = "my-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my_subnet" {
  name          = "my-subnet"
  network       = google_compute_network.my_network.self_link
  ip_cidr_range = "10.0.0.0/24"
}

resource "google_compute_instance" "gromacs_instance-2" {
  name         = "gromacs-instance-2"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"
  tags         = ["allow-ssh"]

  boot_disk {
    initialize_params {
      image = "product/canonical-public/ubuntu-pro-2004-focal"
      size  = 50
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.my_subnet.self_link
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y gromacs
  EOF

}

