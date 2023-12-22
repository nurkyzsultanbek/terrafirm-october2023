resource "aws_instance" "part2" {
    instance_type = "t2.micro"
 key_name = aws_key_pair.hk1.key_name
 ami = "ami-0ee4f2271a4df2d7d"
}


resource "aws_security_group" sg-part2 {
  name = "launch-wizard-4"
 
  
}
resource "aws_key_pair" "hk1" {
  key_name   = "my-lap-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
  # terraform import aws_instance.part2 i-0823837fdf4927d25
    
  #  terraform import aws_security_group.sg-part2 sg-02e0fa6cd98ac96e2