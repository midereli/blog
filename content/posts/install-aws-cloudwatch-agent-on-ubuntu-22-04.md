---
title: "Install AWS CloudWatch Agent on Ubuntu 22.04"
date: 2022-08-09T10:00:03+00:00
# weight: 1
# aliases: ["/first"]
tags: ["AWS", "CloudWatch", "Ubuntu"]
author: "Merih İnal Dereli"
# author: ["Me", "You"] # multiple authors
showToc: true
TocOpen: false
draft: false
hidemeta: false
comments: false
description: "Let's go and take a look at how we can deploy and configure AWS CloudWatch agent on Ubuntu."
canonicalURL: "https://canonical.url/to/page"
disableHLJS: true # to disable highlightjs
disableShare: false
disableHLJS: false
hideSummary: false
searchHidden: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
ShowRssButtonInSectionTermList: true
UseHugoToc: true
cover:
    #image: "<image path/url>" # image path/url
    #alt: "<alt text>" # alt text
    #caption: "<text>" # display caption under cover
    relative: false # when using page bundles set this to true
    hidden: true # only hide on current single page
editPost:
    URL: "https://github.com/midereli/blog/tree/main/content"
    Text: "Improve this page" # edit text
    appendFilePath: true # to append file path to Edit link
---
To install the AWS CloudWatch agent on your Ubuntu Server 22.04, you should download the appropriate installation package depending on the server's CPU architecture. To find the appropriate installation package, you can run the following command:

```Shell
lscpu | grep "Vendor ID"
```

The output will be either:

```Shell
Vendor ID: ARM
```

or

```Shell
Vendor ID: GenuineIntel
```

Depending on the server's CPU architecture you can download one of the following installation packages.

For ARM (or aarch64) download:

```Shell
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
```

For Intel (or x86_64) download:

```Shell
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/arm64/latest/amazon-cloudwatch-agent.deb
```

After downloading simply run the following command in the directory which you have downloaded the package.

```Shell
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
```

Now, finally, comes the fun part... 😊 We are going to configure the agent. To do that, run:

```Shell
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
```

After answering bunch of questions on what you want to monitor or not, you should now start the agent.

```Shell
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json
```

Congratulations! 🥳 You have installed the AWS CloudWatch agent on your Ubuntu Server 22.04.

You can now navigate to CloudWatch on your favorite browser and click *All Metrics* menu on the left. If everything went well in the installation process, you should be able to see the *CWAgent* namespace and the metrics inside that.

Next steps might be to define alarms depending on those metrics or create dashboards to monitor your server's current and past status in one place.