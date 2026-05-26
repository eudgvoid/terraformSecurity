resource "aws_security_group" "ssh_sg" {
  name        = "cmtr-6pajwelx-ssh-sg"
  vpc_id      = var.vpc_id
  tags = {
    Name = "cmtr-6pajwelx-ssh-sg"
    Project = var.project_id
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.ssh_sg.id
  cidr_ipv4         = var.allowed_ip_range
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_icmp_ssh_sg" {
  security_group_id = aws_security_group.ssh_sg.id
  cidr_ipv4         = var.allowed_ip_range
  from_port         = -1
  ip_protocol       = "icmp"
  to_port           = -1
}


resource "aws_security_group" "public_http_sg" {
  name        = "cmtr-6pajwelx-public-http-sg"
  vpc_id      = var.vpc_id
  tags = {
    Name = "cmtr-6pajwelx-public-http-sg"
    Project = var.project_id
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_pub" {
  security_group_id = aws_security_group.public_http_sg.id
  cidr_ipv4         = var.allowed_ip_range
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_icmp_pub" {
  security_group_id = aws_security_group.http_sg.id
  cidr_ipv4         = var.allowed_ip_range
  from_port         = -1
  ip_protocol       = "icmp"
  to_port           = -1
}

resource "aws_security_group" "private-http-sg" {
  name        = "cmtr-6pajwelx-private-http-sg"
  vpc_id      = var.vpc_id
  tags = {
    Name = "cmtr-6pajwelx-private-http-sg"
    Project = var.project_id
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_priv" {
  security_group_id = aws_security_group.private_http_sg.id
  referenced_security_group_id = aws_security_group.public_http_sg.id
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_icmp_pub" {
  security_group_id = aws_security_group.private_http_sg.id
  referenced_security_group_id = aws_security_group.public_http_sg.id
  from_port         = -1
  ip_protocol       = "icmp"
  to_port           = -1
}

data "aws_instance" "public" {
instance_id = var.public_ec2_instance_id
}

resource "aws_network_interface_sg_attachment" "ssh_pub_attachment" {
  security_group_id    = aws_security_group.ssh_sg
  network_interface_id = data.aws_instance.public.network_interface_id
}

resource "aws_network_interface_sg_attachment" "http_pub_attachment" {
  security_group_id    = aws_security_group.public_http_sg
  network_interface_id = data.aws_instance.public.network_interface_id
}

data "aws_instance" "private" {
instance_id = var.public_ec2_instance_id
}

resource "aws_network_interface_sg_attachment" "ssh_priv_attachment" {
  security_group_id    = aws_security_group.ssh_sg
  network_interface_id = data.aws_instance.priv.network_interface_id
}

resource "aws_network_interface_sg_attachment" "http_priv_attachment" {
  security_group_id    = aws_security_group.private_http_sg
  network_interface_id = data.aws_instance.priv.network_interface_id
}
