# AI Cloud Hub: Integration of Executive Arm

Building on the **Key Takeaways** from the [AI Cloud Hub: Introduction README](ai-cloud-hub.md), this section demonstrates the technical integration of Executive Server components into the AI Cloud Hub using the **Model Context Protocol (MCP)**.

These integrations enable AI agents to autonomously manage infrastructure resources across cloud providers (Azure, AWS, OCI), supported by **modular**, **scalable**, and **self-developed** backend services.

---

## Integration Architecture

![Integration of Executive Arm](images/integrate-Executive.png)

### Key Components:

- **AI Cloud Hub (MCP Client):**  
  Serves as the entry point for triggering operations via natural language, using an AI interface (e.g., Claude Desktop).

- **Executive Servers:**  
  These agent-accessible services abstract interactions with cloud infrastructure. They are the only **self-developed** servers, designed to avoid hardcoding of any cloud-specific services. Their architecture supports full agnosticism to service changes, additions, or removals, ensuring flexibility and adaptability.
  
  - **Autonomous** — respond dynamically to AI agent prompts  
  - **Scalable** — built to extend to other hyperscalers and on-prem environments  
  - **Modular** — easily integrable across diverse cloud platforms

- **Supported Cloud Platforms:**  
  - Microsoft Azure — [GitHub Repo](https://github.com/simplificare-org/mcp-server-azure)  
  - Amazon Web Services (AWS) — [GitHub Repo](https://github.com/simplificare-org/mcp-server-for-aws)  
  - Oracle Cloud Infrastructure (OCI) — [GitHub Repo](https://github.com/simplificare-org/mcp-server-oci)

---

## Use Case Demos

Below are short video recordings demonstrating real-world use cases:

| Use Case                                  | Description                                                                 | Video Link         |
|-------------------------------------------|-----------------------------------------------------------------------------|--------------------|
| 🏗️ Azure Resource Group Creation          | Demonstrates agent-driven creation of a resource group within an Azure subscription. The user initiates the task via natural language, and the AI Cloud Hub executes the request autonomously. | [Watch Video](video/01_01_Azure_Creation.mov)   |
| 🌐 Create VNet and Virtual Machine         | Demonstrates creation of a virtual network followed by a virtual machine in Azure, using simple natural language commands. Once provisioned, resource details are retrieved and displayed. | [Watch Video](#)   |
| 🗑️ List and Delete Azure Resources         | AI agent lists existing Azure resources and deletes them based on user instructions given in plain English, showcasing seamless lifecycle management. | [Watch Video](#)   |
| 🗂️ Create Compartment in OCI               | Demonstrates creation of a new compartment in Oracle Cloud Infrastructure (OCI) using a natural language instruction. Highlights how SyntropAI enables straightforward cross-cloud resource provisioning through conversational AI. | [Watch Video](#)   |
| 🌐 Deploy Web Server on OCI Ampere VM       | AI agent provisions an OCI compute instance, configures a web server, adjusts network/firewall settings, and validates accessibility — all via simple English instructions. | [Watch Video](#)   |
| 🌍 Multilingual and Autonomous Deletion in OCI | Demonstrates the AI agent's ability to process multilingual (German) instructions and autonomously discover, investigate, and safely delete complex infrastructure in OCI. Without prior knowledge of the environment, the agent identifies dependencies, orchestrates safe deletion of components, and removes the VCN safely. | [Watch Video](#)   |

> 🎥 *Videos are hosted on the internal demo portal or shared via secure link.*

---
