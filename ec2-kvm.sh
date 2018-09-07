#/bin/bash


#aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --filter Name=tag:Name,Values=bbb-kvm "Name=instance-state-name,Values=stopped" "Name=availability-zone,Values=us-west-2a" 
# aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --filter Name=tag:Name,Values=bbb-kvm "Name=instance-state-name,Values=stopped" "Name=availability-zone,Values=us-west-1a" 
# aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --filter Name=tag:Name,Values=bbb-kvm "Name=instance-state-name,Values=stopped" "Name=availability-zone,Values=us-east-1b" 




#ec2-describe-instances --filter "availability-zone=us-east-1b" --filter "instance-state-name=stopped" --filter tag:Name=bbb-kvm
#ec2-describe-instances --filter "availability-zone=us-west-1a" --filter "instance-state-name=stopped" --filter tag:Name=bbb-kvm
#ec2-describe-instances --filter "availability-zone=us-west-2a" --filter "instance-state-name=stopped" --filter tag:Name=bbb-kvm


export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.5.1/
export PATH=$PATH:$EC2_HOME/bin

# conta 1
export AWS_ACCESS_KEY=XXXXXXXXXX
export AWS_SECRET_KEY=D9fnABKT9Wcqs0uZIKV3NcH93w2fmc7DnVwDA1iW           

export EC2_URL="ec2.us-east-1.amazonaws.com"
INSTANCES1=`ec2-describe-instances --filter "instance-state-name=stopped" --filter tag:Name=bbb-kvm -H | grep INSTANCE | awk '{ print $2}'`

export EC2_URL="ec2.us-west-1.amazonaws.com"
INSTANCES2=`ec2-describe-instances --filter "instance-state-name=stopped" --filter tag:Name=bbb-kvm -H | grep INSTANCE | awk '{ print $2}'`

export EC2_URL="ec2.us-west-2.amazonaws.com"
INSTANCES3=`ec2-describe-instances --filter "instance-state-name=stopped" --filter tag:Name=bbb-kvm -H | grep INSTANCE | awk '{ print $2}'`


IFS=$'\n'       # make newlines the only separator

COUNT=3

for INSTANCE in $INSTANCES1; do

	export EC2_URL="ec2.us-east-1.amazonaws.com"
	echo "$COUNT - $INSTANCE - $EC2_URL"
	ec2-start-instances $INSTANCE
	COUNT=`expr $COUNT + 1`
	sleep 30
done



for INSTANCE in $INSTANCES2; do

	export EC2_URL="ec2.us-west-1.amazonaws.com"
	echo "$COUNT - $INSTANCE - $EC2_URL"
	ec2-start-instances $INSTANCE
	COUNT=`expr $COUNT + 1`
	sleep 30
done

for INSTANCE in $INSTANCES3; do

	export EC2_URL="ec2.us-west-2.amazonaws.com"
	echo "$COUNT - $INSTANCE - $EC2_URL"
	ec2-start-instances $INSTANCE
	COUNT=`expr $COUNT + 1`
	sleep 30
done



echo
echo conta 2
echo


# conta 2
                      
export AWS_ACCESS_KEY=YYYYYYYYYYYYYYY
export AWS_SECRET_KEY=OMbyHwSgD2+7w7vsnyMzcDsJa+ksrNQhhR3egHRf

export EC2_URL="ec2.us-east-1.amazonaws.com"
INSTANCES1=`ec2-describe-instances --filter "instance-state-name=stopped" --filter tag:Name=bbb-kvm -H | grep INSTANCE | awk '{ print $2}'`

export EC2_URL="ec2.us-west-1.amazonaws.com"
INSTANCES2=`ec2-describe-instances --filter "instance-state-name=stopped" --filter tag:Name=bbb-kvm -H | grep INSTANCE | awk '{ print $2}'`

export EC2_URL="ec2.us-west-2.amazonaws.com"
INSTANCES3=`ec2-describe-instances --filter "instance-state-name=stopped" --filter tag:Name=bbb-kvm -H | grep INSTANCE | awk '{ print $2}'`


IFS=$'\n'       # make newlines the only separator

for INSTANCE in $INSTANCES1; do

	export EC2_URL="ec2.us-east-1.amazonaws.com"
	echo "$COUNT - $INSTANCE - $EC2_URL"
	ec2-start-instances $INSTANCE
	COUNT=`expr $COUNT + 1`
	sleep 30
done



for INSTANCE in $INSTANCES2; do

	export EC2_URL="ec2.us-west-1.amazonaws.com"
	echo "$COUNT - $INSTANCE - $EC2_URL"
	ec2-start-instances $INSTANCE
	COUNT=`expr $COUNT + 1`
	sleep 30
done

for INSTANCE in $INSTANCES3; do

	export EC2_URL="ec2.us-west-2.amazonaws.com"
	echo "$COUNT - $INSTANCE - $EC2_URL"
	ec2-start-instances $INSTANCE
	COUNT=`expr $COUNT + 1`
	sleep 30
done

