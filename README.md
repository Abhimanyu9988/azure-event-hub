# Azure Event Hubs: Ingesting and Processing Big Data Streams

## Introduction

Azure Event Hubs is a powerful big data streaming platform and event ingestion service that can handle millions of events per second. It serves as the "front door" for event pipelines, allowing seamless event ingestion and processing. In this guide, we'll walk you through the process of setting up an Event Hubs namespace, creating an event hub, and sending and receiving events using Python. Let's get started!

## Table of Contents

1. [Prerequisites](#1-prerequisites)
2. [Create an Event Hubs Namespace and Event Hub](#2-create-an-event-hubs-namespace-and-event-hub)
3. [Sending Events to Event Hub](#3-sending-events-to-event-hub)
4. [Receiving Events from Event Hub](#4-receiving-events-from-event-hub)
5. [Conclusion](#5-conclusion)

## 1. Prerequisites

Before we dive into using Azure Event Hubs, make sure you have the following prerequisites in place:
- A Microsoft Azure subscription (sign up for a free trial if you don't have one).
- Python 3.7 or later, with pip installed and updated.
- A code editor (Visual Studio Code is recommended but not mandatory).

## 2. Create an Event Hubs Namespace and Event Hub

We'll start by creating an Event Hubs namespace and an event hub. You can achieve this by running Terraform or using the Azure portal.

#### Using Terraform (Recommended):

Follow these steps to create the resources using Terraform:
- Clone the GitHub repository.
- Initialize Terraform.
- Apply the configuration (auto-approve for a non-interactive run).

```bash
git clone https://github.com/Abhimanyu9988/azure-event-hub.git
cd azure-event-hub
terraform init
terraform apply --auto-approve
```

#### Using Azure Portal:

You can also create the resources manually through the Azure portal. Detailed steps are available in the [Azure Quickstart](<https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-create>).

After deployment, you'll receive the following important values:
- `EVENT_HUB_FULLY_QUALIFIED_NAMESPACE`
- `EVENT_HUB_NAME`

## 3. Sending Events to Event Hub

To send events to your Event Hub, we'll use a Python script. Make sure to replace placeholders with your actual values.

Install the necessary dependencies:

```bash
pip3 install azure-eventhub
pip3 install azure-identity
pip3 install aiohttp
```


Run the script to send events.
```bash
python3 send.py
```


## 4. Receiving Events from Event Hub

Azure Event Hub doesn't provide direct querying of data. To receive events, we'll use a checkpoint mechanism with Azure Blob storage. Ensure you have the required permissions on your storage account.

You can retrieve the following values from Terraform output:
- `BLOB_STORAGE_ACCOUNT_URL`
- `BLOB_CONTAINER_NAME`
- `EVENT_HUB_FULLY_QUALIFIED_NAMESPACE`
- `EVENT_HUB_NAME`

Use these values in the Python script for receiving events.

Install the required dependency:

```bash
pip3 install azure-eventhub-checkpointstoreblob-aio
```


Run the script to start receiving events from your Event Hub.

## 5. Conclusion

Congratulations! You've successfully set up and utilized Azure Event Hubs for ingesting and processing big data streams. This guide has covered creating Event Hub resources, sending events, and receiving events using Python scripts. Explore further and leverage the power of Azure Event Hubs in your data-driven applications. Happy streaming!
