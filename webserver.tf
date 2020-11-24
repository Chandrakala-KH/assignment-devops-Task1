resource "aws_instance" "webinstance" {
   ami           = "ami-03d64741867e7bb94"
   instance_type = "t2.micro"
   key_name      = "${var.privatekey}"
   security_groups = ["${aws_security_group.mysg.name}"]
   tags = {
   Name = "webserver"
   }
   provisioner "local-exec" {
   command = "echo ${aws_instance.webinstance.public_ip} >> /etc/ansible/hosts"
   }

   provisioner "local-exec" {
   command = <<EOT
      sleep 120;
      >invent.ini;
	echo "[webservers]" | tee -a /etc/ansible/inventory;
        echo "${aws_instance.webinstance.public_ip} ansible_user=${var.user_name} ansible_ssh_private_key_file=${var.privatekey}" | tee -a /etc/ansible/inventory;
      	export ANSIBLE_HOST_KEY_CHECKING=False;
        ansible-playbook -u ec2-user --private-key ${var.privatekey} -i /etc/ansible/inventory /etc/ansible/nginx.yml
        EOT
 }
}
resource "aws_security_group" "mysg" {
  vpc_id       = "vpc-a66edccd"
  name         = "websg"
  description  = "My VPC Security Group"
  
  # allow ingress of port 22
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  
} 
  
  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
