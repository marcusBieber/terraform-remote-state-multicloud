# Multi-Cloud Bereitstellung mit Terraform

Dieses Projekt verwendet **Terraform**, um eine Multi-Cloud-Infrastruktur bereitzustellen. Dabei werden Ressourcen in **AWS** und **Azure** erstellt, während der Terraform-Status in einem **S3-Bucket** gespeichert und mit einer **DynamoDB-Tabelle** gelockt wird.

## 📁 Projektstruktur

```sh
multi-cloud-terraform/
│── backend/              # Terraform-Konfiguration für das S3-Backend
│   ├── main.tf           # Erstellt den S3-Bucket und die DynamoDB-Tabelle
│── main.tf               # Haupt-Terraform-Datei (ruft Module auf)
│── providers.tf          # Definition der Multi-Cloud-Provider
│── modules/
│   ├── aws/              # Modul für AWS-Ressourcen (EC2, Security Group)
│   ├── azure/            # Modul für Azure-Ressourcen (Storage Account, Blob Container)
│── variables.tf          # Globale Variablen
│── outputs.tf            # Globale Outputs
│── .gitignore            # Verhindert Committen sensibler Daten
│── README.md             # Dokumentation
```

## 🚀 Anforderungen

- [Terraform](https://developer.hashicorp.com/terraform/downloads) installiert
- [AWS CLI](https://aws.amazon.com/cli/) konfiguriert (`aws configure`)
- [Azure CLI](https://learn.microsoft.com/de-de/cli/azure/install-azure-cli) installiert

## 👅 Repository klonen

```sh
git clone https://github.com/marcusBieber/terraform-remote-state-multicloud.git
cd erraform-remote-state-multicloud
```

## 🏠 Terraform initialisieren

Lade die Terraform-Provider:

```sh
terraform init
```

## 🚀 Terraform-Backend vorbereiten

Erstelle zuerst das S3-Backend und die DynamoDB-Tabelle:

```sh
cd backend
terraform apply -auto-approve
cd ..
```

## 🚀 Infrastruktur bereitstellen

Starte die Bereitstellung der Multi-Cloud-Infrastruktur:

```sh
terraform apply -auto-approve
```

Nach erfolgreichem Deployment werden die **Public IP der EC2-Instanz** und der **Name des Azure Storage Accounts** als Output angezeigt.

## 🚫 Infrastruktur löschen

Falls du alle erstellten Ressourcen wieder entfernen möchtest:

```sh
terraform destroy -auto-approve
```

## 📌 Hinweise

Falls der State-Lock Probleme macht, kann der Lock-Eintrag in DynamoDB entfernt werden:

```sh
aws dynamodb delete-item --table-name terraform-state-lock --key '{"Lock_ID": {"S": "default"}}'
```

