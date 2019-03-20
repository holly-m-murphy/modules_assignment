terraform{
  backend "s3"{
    bucket="table2hmterraform"
    key="modules/state"
    region="eu-west-1"
  }
}
