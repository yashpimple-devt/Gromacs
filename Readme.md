## Specific tasks to be done:

1. Install GROMACS 19.04 on a GCP VM instance with the following specifications:
   - Region: us-central 1 (Iowa)
   - Zone: us-central-a
   - Machine type: n1-standard-2
   - Boot disk: Ubuntu (version compatible with GROMACS 19.04, such as 16.04, 18.04, or 20.04)
   - Boot disk size: 50 GB
2. Enable GPU acceleration on the VM instance.
3. Ensure that GROMACS can run in the background even after the SSH or Shell Cloud Terminal session is closed.
4. Configure GROMACS to sync output files to a bucket.
5. Use Terraform for IaC to provision and manage the VM instance and GROMACS installation.
6. Dockerize GROMACS or create a shell script to automate the installation and configuration process.
7. Use Ansible to configure and set up GROMACS, or use both Terraform and Ansible together for a more comprehensive solution.
8. Start a POC and test the GROMACS installation on GCP.


## Install GROMACS 19.04

 ```
   gcloud compute instances create gromacs-instance \
   --region us-central1-a \
   --zone us-central1-a \
   --machine-type n1-standard-2 \
   --boot-disk-size 50GB \
   --boot-disk-type standard \
   --boot-disk-image ubuntu-20.04-focal-v20230804
 ```

 ```
  sudo apt update
  # Install GROMACS
  sudo apt install gromacs
 ```

## Dockerize GROMACS
```bash
FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y gromacs \
    apt-get install -y nvidia-driver-470

CMD ["gmx"]
```

docker build -t gromacs:latest .

docker run -it --gpus all gromacs:latest

