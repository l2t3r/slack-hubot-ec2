#!/bin/bash
die () {
      echo >&2 "$@"
      exit 1
  }


[[ "$#" -eq 2 ]]  || die "2 arguments required, $# provided, <Role> <region> eg web1 us-west-1"


#Get ip address from tags. Please note this is not from load balancer
IPS=`aws ec2 describe-instances --region $2 --filters "Name=tag:Role,Values=$1" --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text`
echo $IPS
