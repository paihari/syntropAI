// Multicloud Deployment Neo4j Graph Script
// Date: May 6, 2025
// Description: This script creates a Neo4j graph representation of the multicloud infrastructure 
// deployed across AWS, OCI, and Azure, following the hierarchical model specified in the owner rule-book.

// Clear previous deployment data if needed (optional)
// MATCH (n) WHERE n.deployment_id = "MulticloudDeployment-2025-05-06" DETACH DELETE n;

// --- AWS INFRASTRUCTURE ---

// Create AWS Account Node
CREATE (aws:AWSAccount {
  name: "AWS Account",
  id: "aws-account",
  deployment_id: "MulticloudDeployment-2025-05-06",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create AWS Region Node
CREATE (region:AWSRegion {
  name: "eu-central-1", 
  location: "Frankfurt",
  deployment_id: "MulticloudDeployment-2025-05-06",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create AWS VPC Node
CREATE (vpc:AWSVPC {
  name: "syntropAI-VPC",
  id: "vpc-0793117f2837e801c",
  cidr: "10.0.0.0/16",
  deployment_id: "MulticloudDeployment-2025-05-06",
  environment: "dev",
  sensitivity: "internal",
  costCenter: "syntropAI-Project",
  owner: "Multicloud-Orchestrator",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create AWS Subnet Node
CREATE (subnet:AWSSubnet {
  name: "syntropAI-Subnet",
  id: "subnet-048b699747cc9c719",
  cidr: "10.0.1.0/24",
  deployment_id: "MulticloudDeployment-2025-05-06",
  environment: "dev",
  sensitivity: "internal",
  costCenter: "syntropAI-Project",
  owner: "Multicloud-Orchestrator",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create AWS EC2 Instance Node
CREATE (ec2:AWSEC2 {
  name: "syntropAI-VM",
  id: "i-01644e8ebbf11a3eb",
  type: "t2.micro",
  os: "Amazon Linux 2023",
  deployment_id: "MulticloudDeployment-2025-05-06",
  environment: "dev",
  sensitivity: "internal",
  costCenter: "syntropAI-Project",
  owner: "Multicloud-Orchestrator",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create AWS DynamoDB Node
CREATE (dynamodb:AWSDynamoDB {
  name: "syntropAI-DynamoDB",
  deployment_id: "MulticloudDeployment-2025-05-06",
  environment: "dev",
  sensitivity: "internal",
  costCenter: "syntropAI-Project",
  owner: "Multicloud-Orchestrator",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create AWS Hierarchical Relationships
MATCH (account:AWSAccount {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (region:AWSRegion {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (account)-[:CONTAINS]->(region);

MATCH (region:AWSRegion {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (vpc:AWSVPC {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (region)-[:CONTAINS]->(vpc);

MATCH (vpc:AWSVPC {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (subnet:AWSSubnet {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (vpc)-[:CONTAINS]->(subnet);

MATCH (subnet:AWSSubnet {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (ec2:AWSEC2 {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (subnet)-[:CONTAINS]->(ec2);

MATCH (region:AWSRegion {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (dynamodb:AWSDynamoDB {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (region)-[:CONTAINS]->(dynamodb);

// --- OCI INFRASTRUCTURE ---

// Create OCI Tenant Node
CREATE (tenant:OCITenant {
  name: "OCI Tenant",
  deployment_id: "MulticloudDeployment-2025-05-06",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create OCI Compartment Node
CREATE (compartment:OCICompartment {
  name: "Root Compartment",
  deployment_id: "MulticloudDeployment-2025-05-06",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create OCI Region Node
CREATE (region:OCIRegion {
  name: "eu-frankfurt-1",
  location: "Frankfurt",
  deployment_id: "MulticloudDeployment-2025-05-06",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create OCI VCN Node
CREATE (vcn:OCIVCN {
  name: "syntropAI-VCN",
  id: "ocid1.vcn.oc1.eu-frankfurt-1.amaaaaaasvm4qnyaoet7otqtbukzs3kairqugz5wiswskhety63re5nxymfq",
  cidr: "10.0.0.0/16",
  deployment_id: "MulticloudDeployment-2025-05-06",
  environment: "dev",
  sensitivity: "internal",
  costCenter: "syntropAI-Project",
  owner: "Multicloud-Orchestrator",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create OCI Subnet Node
CREATE (subnet:OCISubnet {
  name: "syntropAI-PrivateSubnet",
  id: "ocid1.subnet.oc1.eu-frankfurt-1.aaaaaaaafgrzdlrjsne2slbyoa2s5z4gyjsdomp3zrm5nubn2x7q743uqvha",
  cidr: "10.0.1.0/24",
  is_public: false,
  deployment_id: "MulticloudDeployment-2025-05-06",
  environment: "dev",
  sensitivity: "internal",
  costCenter: "syntropAI-Project",
  owner: "Multicloud-Orchestrator",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create OCI VM Node
CREATE (vm:OCIComputeInstance {
  name: "syntropAI-VM",
  id: "ocid1.instance.oc1.eu-frankfurt-1.antheljssvm4qnycc65hc2rh3zq7z5f5gt5iv45pwteof64lakk26nnaf5va",
  shape: "VM.Standard.A1.Flex",
  ocpus: 1,
  memory_gb: 6,
  os: "Oracle Linux 8",
  deployment_id: "MulticloudDeployment-2025-05-06",
  environment: "dev",
  sensitivity: "internal",
  costCenter: "syntropAI-Project",
  owner: "Multicloud-Orchestrator",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create OCI MySQL Node
CREATE (mysql:OCIMySQL {
  name: "syntropAI-MySQL",
  id: "ocid1.mysqldbsystem.oc1.eu-frankfurt-1.aaaaaaaahlr2zqlua6gsjvwgauxlbgqbvlma3ar4qxcrax5uv6rwaw3cudqq",
  shape: "MySQL.VM.Standard.E3.1.8GB",
  deployment_id: "MulticloudDeployment-2025-05-06",
  environment: "dev",
  sensitivity: "internal",
  costCenter: "syntropAI-Project",
  owner: "Multicloud-Orchestrator",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create OCI Hierarchical Relationships
MATCH (tenant:OCITenant {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (compartment:OCICompartment {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (tenant)-[:CONTAINS]->(compartment);

MATCH (compartment:OCICompartment {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (region:OCIRegion {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (compartment)-[:CONTAINS]->(region);

MATCH (region:OCIRegion {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (vcn:OCIVCN {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (region)-[:CONTAINS]->(vcn);

MATCH (vcn:OCIVCN {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (subnet:OCISubnet {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (vcn)-[:CONTAINS]->(subnet);

MATCH (subnet:OCISubnet {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (vm:OCIComputeInstance {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (subnet)-[:CONTAINS]->(vm);

MATCH (vcn:OCIVCN {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (mysql:OCIMySQL {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (vcn)-[:CONTAINS]->(mysql);

// --- AZURE INFRASTRUCTURE ---

// Create Azure Tenant Node
CREATE (tenant:AzureTenant {
  name: "Azure Tenant",
  deployment_id: "MulticloudDeployment-2025-05-06",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create Azure Subscription Node
CREATE (subscription:AzureSubscription {
  name: "Azure Subscription",
  id: "7b0e3896-8ef3-4ff1-bbfb-5896f9344ca2",
  deployment_id: "MulticloudDeployment-2025-05-06",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create Azure Resource Group Node
CREATE (rg:AzureResourceGroup {
  name: "syntropAI-Azure",
  deployment_id: "MulticloudDeployment-2025-05-06",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create Azure Region Node
CREATE (region:AzureRegion {
  name: "eastus",
  location: "East US",
  deployment_id: "MulticloudDeployment-2025-05-06",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create Azure VNet Node
CREATE (vnet:AzureVNet {
  name: "syntropAI-Vnet",
  id: "/subscriptions/7b0e3896-8ef3-4ff1-bbfb-5896f9344ca2/resourceGroups/syntropAI-Azure/providers/Microsoft.Network/virtualNetworks/syntropAI-Vnet",
  cidr: "10.0.0.0/16",
  deployment_id: "MulticloudDeployment-2025-05-06",
  environment: "dev",
  sensitivity: "internal",
  costCenter: "syntropAI-Project",
  owner: "Multicloud-Orchestrator",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create Azure VM Node
CREATE (vm:AzureVM {
  name: "syntropAI-VM",
  id: "/subscriptions/7b0e3896-8ef3-4ff1-bbfb-5896f9344ca2/resourceGroups/syntropAI-Azure/providers/Microsoft.Compute/virtualMachines/syntropAI-VM",
  size: "Standard_B1ls",
  vcpus: 1,
  memory_gb: 0.5,
  os: "Ubuntu Server 20.04 LTS",
  deployment_id: "MulticloudDeployment-2025-05-06",
  environment: "dev",
  sensitivity: "internal",
  costCenter: "syntropAI-Project",
  owner: "Multicloud-Orchestrator",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create Azure SQL Server Node
CREATE (sqlserver:AzureSQLServer {
  name: "syntropai-sqlserver",
  id: "/subscriptions/7b0e3896-8ef3-4ff1-bbfb-5896f9344ca2/resourceGroups/syntropAI-Azure/providers/Microsoft.Sql/servers/syntropai-sqlserver",
  deployment_id: "MulticloudDeployment-2025-05-06",
  environment: "dev",
  sensitivity: "internal",
  costCenter: "syntropAI-Project",
  owner: "Multicloud-Orchestrator",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create Azure SQL Database Node
CREATE (sqldb:AzureSQLDatabase {
  name: "syntropAI-SQL",
  id: "/subscriptions/7b0e3896-8ef3-4ff1-bbfb-5896f9344ca2/resourceGroups/syntropAI-Azure/providers/Microsoft.Sql/servers/syntropai-sqlserver/databases/syntropAI-SQL",
  tier: "Basic",
  deployment_id: "MulticloudDeployment-2025-05-06",
  environment: "dev",
  sensitivity: "internal",
  costCenter: "syntropAI-Project",
  owner: "Multicloud-Orchestrator",
  created_at: datetime("2025-05-06T12:00:00")
});

// Create Azure Hierarchical Relationships
MATCH (tenant:AzureTenant {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (subscription:AzureSubscription {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (tenant)-[:CONTAINS]->(subscription);

MATCH (subscription:AzureSubscription {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (rg:AzureResourceGroup {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (subscription)-[:CONTAINS]->(rg);

MATCH (rg:AzureResourceGroup {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (region:AzureRegion {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (rg)-[:CONTAINS]->(region);

MATCH (region:AzureRegion {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (vnet:AzureVNet {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (region)-[:CONTAINS]->(vnet);

MATCH (vnet:AzureVNet {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (vm:AzureVM {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (vnet)-[:CONTAINS]->(vm);

MATCH (rg:AzureResourceGroup {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (sqlserver:AzureSQLServer {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (rg)-[:CONTAINS]->(sqlserver);

MATCH (sqlserver:AzureSQLServer {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (sqldb:AzureSQLDatabase {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (sqlserver)-[:CONTAINS]->(sqldb);

// --- DEPLOYMENT METADATA ---

// Create Deployment Node
CREATE (deployment:Deployment {
  name: "MulticloudDeployment-2025-05-06",
  deployment_id: "MulticloudDeployment-2025-05-06",
  timestamp: datetime("2025-05-06T12:00:00"),
  description: "Multicloud deployment of VMs and databases across AWS, OCI, and Azure",
  compliant: true,
  created_by: "Multicloud-Orchestrator"
});

// Create Deployment Relationships
MATCH (deployment:Deployment {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (aws:AWSAccount {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (deployment)-[:DEPLOYED_TO]->(aws);

MATCH (deployment:Deployment {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (oci:OCITenant {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (deployment)-[:DEPLOYED_TO]->(oci);

MATCH (deployment:Deployment {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (azure:AzureTenant {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (deployment)-[:DEPLOYED_TO]->(azure);

// --- ADD ADDITIONAL METADATA RELATIONSHIPS ---

// Link EC2 to DynamoDB (Application Relationship)
MATCH (ec2:AWSEC2 {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (dynamodb:AWSDynamoDB {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (ec2)-[:CONNECTS_TO {purpose: "Database Access"}]->(dynamodb);

// Link OCI VM to MySQL DB (Application Relationship)
MATCH (vm:OCIComputeInstance {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (mysql:OCIMySQL {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (vm)-[:CONNECTS_TO {purpose: "Database Access"}]->(mysql);

// Link Azure VM to SQL DB (Application Relationship)
MATCH (vm:AzureVM {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (sqldb:AzureSQLDatabase {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (vm)-[:CONNECTS_TO {purpose: "Database Access", via: "SQL Server"}]->(sqldb);

// Add execution metadata
CREATE (execution:ExecutionSession {
  name: "Multicloud-Execution-Session-2025-05-06",
  deployment_id: "MulticloudDeployment-2025-05-06",
  timestamp: datetime("2025-05-06T12:00:00"),
  executor: "Multicloud-Orchestrator",
  rules_followed: ["CISO region requirements", "FinOps VM specifications", "Security subnet rules", "Tagging policies"],
  slack_notification_sent: true
});

MATCH (execution:ExecutionSession {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH (deployment:Deployment {deployment_id: "MulticloudDeployment-2025-05-06"})
CREATE (execution)-[:EXECUTED]->(deployment);